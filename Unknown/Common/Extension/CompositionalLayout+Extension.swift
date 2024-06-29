//
//  CompositionalLayout+Extension.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 14.01.2024.
//

import UIKit
func result<Result>(from block: () -> Result) -> Result {
    return block()
}
extension NSCollectionLayoutSize {
    static func make() -> NSCollectionLayoutSize {
        return NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
    }
    
    static func make(height: CGFloat) -> NSCollectionLayoutSize {
        return NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(height)
        )
    }
    
    static func make(estimatedHeight: CGFloat) -> NSCollectionLayoutSize {
        return NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(estimatedHeight)
        )
    }
    
    static func make(size: CGFloat) -> NSCollectionLayoutSize {
        return NSCollectionLayoutSize(
            widthDimension: .absolute(size),
            heightDimension: .absolute(size)
        )
    }
    
    static func makeDynamicHeight(
        contentSize: CGSize,
        defaultHeightToWidthMultiplier: CGFloat
    ) -> NSCollectionLayoutSize {
        let heightMultiplier: CGFloat = result {
            if contentSize.width.isZero {
                return defaultHeightToWidthMultiplier
            }
            let multiplier = contentSize.height / contentSize.width
            return multiplier.isZero ? defaultHeightToWidthMultiplier : multiplier
        }
        return NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(heightMultiplier)
        )
    }
    
    static func makeDynamicWidth(
        contentSize: CGSize,
        defaultWidthToHeightMultiplier: CGFloat
    ) -> NSCollectionLayoutSize {
        let widthMultiplier: CGFloat = result {
            if contentSize.height.isZero {
                return defaultWidthToHeightMultiplier
            }
            let multiplier = contentSize.width / contentSize.height
            return multiplier.isZero ? defaultWidthToHeightMultiplier : multiplier
        }
        return NSCollectionLayoutSize(
            widthDimension: .fractionalHeight(widthMultiplier),
            heightDimension: .fractionalHeight(1)
        )
    }
}

// MARK: - Item

extension NSCollectionLayoutItem {
    static func make() -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem(layoutSize: .make())
    }
}

// MARK: - Group

extension NSCollectionLayoutGroup {
    static func makeRow(height: CGFloat) -> NSCollectionLayoutGroup {
        return .horizontal(layoutSize: .make(estimatedHeight: height), subitems: [.make()])
    }
}

// MARK: - Configuration

extension NSCollectionLayoutSection {
    func withSupplementary(_ item: NSCollectionLayoutBoundarySupplementaryItem) -> Self {
        boundarySupplementaryItems = [item]
        return self
    }
    
    func withGroupSpacing(_ space: CGFloat) -> Self {
        interGroupSpacing = space
        return self
    }
}

// MARK: - Invalidation Handlers

func CollectionLayoutInvalidationHandlerComposite(
    handlers: [NSCollectionLayoutSectionVisibleItemsInvalidationHandler]
) -> NSCollectionLayoutSectionVisibleItemsInvalidationHandler {
    return { visibleItems, scrollOffset, layoutEnvironment in
        handlers.forEach { $0(visibleItems, scrollOffset, layoutEnvironment) }
    }
}

extension NSCollectionLayoutSection {
    static func makeCarouselInvalidationHandler(itemContentInsets: NSDirectionalEdgeInsets = .zero) -> NSCollectionLayoutSectionVisibleItemsInvalidationHandler {
        { items, contentOffset, environment in
            items
                .filter { $0.representedElementCategory == .cell }
                .forEach { cell in
                    let cellCenter = cell.frame.midX - contentOffset.x
                    let cellWidth = cell.bounds.width + itemContentInsets.sideInsets
                    let containerCenter = environment.container.effectiveContentSize.width / 2.0
                    let actualDistanceFromCenter = abs(cellCenter - containerCenter)
                    let distanceFromCenter = min(actualDistanceFromCenter, cellWidth)
                    
                    let distanceRange = 0.0...cellWidth
                    let scaleRange = CGFloat(0.75)...1.0
                    
                    let projectedValue = distanceRange.map(value: distanceFromCenter, within: scaleRange)
                    let scale = scaleRange.upperBound - projectedValue + scaleRange.lowerBound
                    cell.transform = CGAffineTransform(scaleX: scale, y: scale)
                }
        }
    }
    
    static func makeCarouselAlphaInvalidationHandler(
        onSelect: @escaping (IndexPath, CGFloat) -> Void,
        itemContentInsets: NSDirectionalEdgeInsets = .zero
    ) -> NSCollectionLayoutSectionVisibleItemsInvalidationHandler {
        { items, contentOffset, environment in
            items
                .filter { $0.representedElementCategory == .cell }
                .map { cell -> (NSCollectionLayoutVisibleItem, CGFloat, CGFloat) in
                    let cellCenter = cell.frame.midX - contentOffset.x
                    let cellWidth = cell.bounds.width + itemContentInsets.sideInsets
                    let containerCenter = environment.container.effectiveContentSize.width / 2.0
                    let actualDistanceFromCenter = abs(cellCenter - containerCenter)
                    let distanceFromCenter = min(actualDistanceFromCenter, cellWidth)
                    
                    let distanceRange = 0.0...cellWidth
                    let alphaRange = CGFloat(0.32)...1.0
                    
                    let projectedValue = distanceRange.map(value: distanceFromCenter, within: alphaRange)
                    let alpha = alphaRange.upperBound - projectedValue + alphaRange.lowerBound
                    cell.alpha = alpha
                    return (cell, distanceFromCenter, alpha)
                }
                .min(by: { l, r in
                    return l.1 < r.1
                })
                .flatMap {
                    onSelect($0.0.indexPath, $0.2)
                }
        }
    }
}

// MARK: - Helpers

private extension ClosedRange {
    /// http://learnwebgl.brown37.net/08_projections/projections_mapping.html
    func map(value: CGFloat, within otherRange: ClosedRange<CGFloat>) -> CGFloat where Bound == CGFloat {
        let A = lowerBound
        let B = upperBound
        let C = otherRange.lowerBound
        let D = otherRange.upperBound
        
        let scale = (D - C) / (B - A)
        let offset = -A * (D - C) / (B - A) + C
        return value * scale + offset
    }
}

private extension NSDirectionalEdgeInsets {
    var sideInsets: CGFloat { leading + trailing }
}

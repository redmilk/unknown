//
//  HomeCollectionView.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit

final class HomeCollectionView: UICollectionView {
    
    struct ViewModel {
        struct Block {
            let section: Section
            let items: [Item]
        }
        
        let blocks: [Block]
        let onSeeAll: Command
        let onScrolledToIndex: CommandWith<Int>
        let hasAnyCollection: Bool
        let isThemePacksAB: Bool
    }
    
    struct Item: HashItem {
        let hash: Int
        let kind: Kind
        
        enum Kind {
            case header(HeaderCell.ViewModel)
            case userCollection(MultipleImageCell.ViewModel, onSelect: Command)
            case style(ContentCell.ViewModel, onSelect: Command)
            case themePack(ContentCell.ViewModel, onSelect: Command)
            case preview(MultipleImagePreviewCell.ViewModel, onSelect: Command)
        }
    }
    
    enum Section: Hashable, CaseIterable {
        case header
        case userCollections
        case styles
        case themePacks
        case resultOverview
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    private lazy var diffable: DataSource = makeDataSource()
    private var viewModel: ViewModel = .initial
    
    private lazy var invalidateLayoutOnce: Void = collectionViewLayout.invalidateLayout()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        
        registerCell(HeaderCell.self)
        registerCell(HorizontalScrollCell.self)
        registerCell(MultipleImageCell.self)
        registerCell(ContentCell.self)

        registerSupplementary(SectionHeaderView.self)
        registerSupplementary(HeaderView.self)

        showsVerticalScrollIndicator = false
        automaticallyAdjustsScrollIndicatorInsets = false
        delegate = self
        decelerationRate = .normal
        collectionViewLayout = makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        diffable.apply(makeSnapshot(), animatingDifferences: false) { [weak self] in
            guard viewModel.blocks.hasElements else {
                return
            }
            DispatchQueue.main.async {
                _ = self?.invalidateLayoutOnce
            }
        }
    }
}

// MARK: - Data source

extension HomeCollectionView {
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: self,
            cellProvider: { collectionView, indexPath, item in
                switch item.kind {
                case let .header(header):
                    let cell = collectionView.dequeueCell(ofType: HeaderCell.self, for: indexPath)
                    cell.update(with: header)
                    return cell
                case let .preview(vm, _):
                    let cell = collectionView.dequeueCell(ofType: MultipleImagePreviewCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                case let .userCollection(vm, _):
                    let cell = collectionView.dequeueCell(ofType: MultipleImageCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                case let .style(vm, _):
                    let cell = collectionView.dequeueCell(ofType: ContentCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                case let .themePack(vm, _):
                    let cell = collectionView.dequeueCell(ofType: ContentCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                }
            }
        )
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            switch kind {
            case HeaderView.reuseIdentifier:
                let header = collectionView.dequeueSupplementary(ofType: HeaderView.self, for: indexPath)
                return header
            default:
                return nil
            }
        }
        return dataSource
    }
    
    private func makeSnapshot() -> Snapshot {
        var snapshot = Snapshot()
        snapshot.appendSections(viewModel.blocks.map(\.section))
        viewModel.blocks.forEach { block in
            snapshot.appendItems(block.items, toSection: block.section)
        }
        return snapshot
    }
}

// MARK: - UICollectionView Delegate

extension HomeCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch diffable.itemIdentifier(for: indexPath)?.kind {
        case let .style(_, onSelect):
            onSelect.perform()
        case let .themePack(_, onSelect):
            onSelect.perform()
        case let .userCollection(_, onSelect):
            onSelect.perform()
        case let .preview(_, onSelect):
            onSelect.perform()
        default:
            break
        }
    }
}

// MARK: - Layout

private extension HomeCollectionView {
    func makeLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(
            sectionProvider: { [weak self] section, environment in
                self?.createSection(sectionIndex: section, layoutEnvironment: environment)
            }
        )
        layout.register(
            BackgroundDecorationView.self,
            forDecorationViewOfKind: BackgroundDecorationView.reuseIdentifier
        )
        return layout
    }
    
    func createSection(
        sectionIndex: Int,
        layoutEnvironment: NSCollectionLayoutEnvironment
    ) -> NSCollectionLayoutSection? {
        guard let section = diffable.snapshot().sectionIdentifiers[safe: sectionIndex] else {
            return nil
        }
        switch section {
        case .header:
            return descriptionSection()
        case .themePacks:
            return themePacksSection()
        case .userCollections:
            return userCollectionsSection()
        case .styles:
            return productsSection()
        case .resultOverview:
            return nil
        }
    }
    
    func themePacksSection() -> NSCollectionLayoutSection {
        let widthDimension: CGFloat = bounds.width * 0.43
        let heightDimension: CGFloat = widthDimension * 1.4

        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(widthDimension),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(widthDimension + 12),
            heightDimension: .absolute(heightDimension)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 4, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .make(height: 70),
            elementKind: HeaderView.reuseIdentifier,
            alignment: .top
        )
        header.pinToVisibleBounds = true
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]

        return section
    }
    
    func descriptionSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize.make(height: getMainHeaderHeight())
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: itemSize,
            subitems: [item]
        )
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    func getMainHeaderHeight() -> CGFloat {
        guard viewModel.hasAnyCollection else {
            return UIScreen.main.bounds.width * 3 / 4
        }
        return 50
    }

    func userCollectionsSection() -> NSCollectionLayoutSection {
        let itemSize: CGFloat = 171
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .absolute(itemSize),
            heightDimension: .fractionalHeight(1)
        ))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .make(size: itemSize),
            subitems: [item]
        )
        group.interItemSpacing = .fixed(Constants.interItemSpacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .make(height: Constants.headerHeight),
            elementKind: HeaderView.reuseIdentifier,
            alignment: .top
        )
        header.pinToVisibleBounds = true
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]

        return section
    }
    
    func productsSection() -> NSCollectionLayoutSection {
        let itemsInRow: Int = 2
        let widthDimension = NSCollectionLayoutDimension.fractionalWidth(1 / CGFloat(itemsInRow))
        let heightDimension = NSCollectionLayoutDimension.fractionalWidth(1 / CGFloat(itemsInRow) * 1.33)

        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: widthDimension,
            heightDimension: heightDimension
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: heightDimension
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: itemsInRow)
        group.interItemSpacing = .fixed(12)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        let inset = Constants.sectionInset
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: inset, bottom: 8, trailing: inset)

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .make(height: Constants.headerHeight),
            elementKind: HeaderView.reuseIdentifier,
            alignment: .top
        )
        header.pinToVisibleBounds = true
        header.zIndex = Int.max
        section.boundarySupplementaryItems = viewModel.isThemePacksAB ? [header] : []

        return section
    }
    
    enum Constants {
        static let itemSizeCoefficient: CGFloat = 1.5
        static let sectionInset: CGFloat = 16
        static let interItemSpacing: CGFloat = 16
        static let headerHeight: CGFloat = 56
        static let generatingHeaderHeight: CGFloat = UIScreen.main.bounds.height * 0.25
        static let generatingFooterHeight: CGFloat = 60
        static let generatingProcessHeight: CGFloat = 60
    }
}

// MARK: - Factory

private extension HomeCollectionView.ViewModel {
    static var initial: HomeCollectionView.ViewModel {
        HomeCollectionView.ViewModel(
            blocks: [],
            onSeeAll: .nop,
            onScrolledToIndex: .nop,
            hasAnyCollection: true,
            isThemePacksAB: false
        )
    }
}

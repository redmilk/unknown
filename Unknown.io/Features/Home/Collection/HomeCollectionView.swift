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
        
        let getTitleForSectionAtIndexPath: ((IndexPath) -> String)?
        let onSeeAll: Command
        let onScrolledToIndex: CommandWith<Int>
        
        static let initial = ViewModel(blocks: [], getTitleForSectionAtIndexPath: nil, onSeeAll: .nop, onScrolledToIndex: .nop)
    }
    
    struct Item: HashItem {
        let hash: Int
        let kind: Kind
        
        enum Kind {
            case classicGenerator(ClassicGeneratorCell.ViewModel)
            case categoriesGenerator(CategoriesGeneratorCell.ViewModel)
            case imageGenerator(ImageGeneratorCell.ViewModel)
            case imageResult(ContentCell.ViewModel)
            case subcategory(SubCategoryCell.ViewModel)
            case classicQuiz(ClassicQuizCell.ViewModel)
            // samples
            case horizontalCollection(MultipleImageCell.ViewModel)
            case verticalDouble(ContentCell.ViewModel)
        }
    }
    
    struct Section: HashItem {
        let hash: Int
        let kind: Kind
        
        enum Kind {
            case generators
            case categoriesSection
            case classicQuiz
            case imageGenerations
            case horizontalCollections
            case verticalDouble
            case horizontalSection
        }
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    private lazy var diffable: DataSource = makeDataSource()
    private var viewModel: ViewModel = ViewModel.initial
    
    private lazy var invalidateLayoutOnce: Void = collectionViewLayout.invalidateLayout()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        
        registerCell(ClassicGeneratorCell.self)
        registerCell(CategoriesGeneratorCell.self)
        registerCell(ImageGeneratorCell.self)
        registerCell(CategoryCell.self)
        registerCell(HorizontalScrollCell.self)
        registerCell(MultipleImageCell.self)
        registerCell(ContentCell.self)
        registerCell(ClassicQuizCell.self)
        registerCell(SubCategoryCell.self)

        registerSupplementary(CategoryHeader.self)
        registerSupplementary(SectionHeaderView.self)
        registerSupplementary(HeaderView.self)

        showsVerticalScrollIndicator = false
        automaticallyAdjustsScrollIndicatorInsets = false
        delegate = self
        decelerationRate = .normal
        collectionViewLayout = makeLayout()
        backgroundColor = .black
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
                case let .classicGenerator(vm):
                    let cell = collectionView.dequeueCell(ofType: ClassicGeneratorCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                case let .categoriesGenerator(vm):
                    let cell = collectionView.dequeueCell(ofType: CategoriesGeneratorCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                case let .imageGenerator(vm):
                    let cell = collectionView.dequeueCell(ofType: ImageGeneratorCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                case let .imageResult(vm):
                    let cell = collectionView.dequeueCell(ofType: ContentCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                case let .horizontalCollection(vm):
                    let cell = collectionView.dequeueCell(ofType: MultipleImageCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                case let .verticalDouble(vm):
                    let cell = collectionView.dequeueCell(ofType: ContentCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                case let .subcategory(vm):
                    let cell = collectionView.dequeueCell(ofType: SubCategoryCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                case let .classicQuiz(vm):
                    let cell = collectionView.dequeueCell(ofType: ClassicQuizCell.self, for: indexPath)
                    cell.update(with: vm)
                    return cell
                }
            }
        )
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            switch kind {
            case HeaderView.reuseIdentifier:
                let header = collectionView.dequeueSupplementary(ofType: HeaderView.self, for: indexPath)
                switch indexPath.section {
                case _: break
                }
                return header
            case CategoryHeader.reuseIdentifier:
                let header = collectionView.dequeueSupplementary(ofType: CategoryHeader.self, for: indexPath)
                let title = self.viewModel.getTitleForSectionAtIndexPath?(indexPath)
                header.update(with: .init(title: title ?? "-", subtitle: ""))
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
        case let .verticalDouble(vm):
            vm.onSelect.perform()
        case let .subcategory(vm):
            vm.onTap()
        case let .horizontalCollection(vm):
            break//vm.perform()
        case let .classicQuiz(vm):
            break
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
        switch section.kind {
        case .generators:
            return descriptionSection()
        case .categoriesSection:
            return categoriesSection()
        case .horizontalSection:
            return horizontalSection()
        case .horizontalCollections:
            return userCollectionsSection()
        case .verticalDouble:
            return verticalDoubleSection()
        case .classicQuiz:
            return verticalSingleSection()
        case .imageGenerations:
            return imageGenerationsSection()
        }
    }
    
    func imageGenerationsSection() -> NSCollectionLayoutSection {
        let widthDimension = NSCollectionLayoutDimension.fractionalWidth(1)
        let heightDimension = NSCollectionLayoutDimension.estimated(150)

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
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        let inset = Constants.sectionInset
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: inset, bottom: 8, trailing: inset)
        section.interGroupSpacing = 20

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
    
    func horizontalSection() -> NSCollectionLayoutSection {
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
    
    func categoriesSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0 / 10.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(400)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        // Column Group
        let columnGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.45),//1.0 / 3.0),
            heightDimension: .absolute(400)
        )
        let columnGroup = NSCollectionLayoutGroup.horizontal(layoutSize: columnGroupSize, subitems: [group])
        columnGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        // Section
        let section = NSCollectionLayoutSection(group: columnGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous

        // Header (optional)
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(20)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: CategoryHeader.reuseIdentifier,
            alignment: .top
        )
        header.pinToVisibleBounds = true
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]

        return section
    }

    
    func descriptionSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(200)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(bounds.width),
            heightDimension: .absolute(200)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging

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
    
    func verticalDoubleSection() -> NSCollectionLayoutSection {
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
        section.boundarySupplementaryItems = [header]

        return section
    }
    
    func verticalSingleSection() -> NSCollectionLayoutSection {
        let itemsInRow: Int = 1
        let widthDimension = NSCollectionLayoutDimension.fractionalWidth(1 / CGFloat(itemsInRow))
        let heightDimension = NSCollectionLayoutDimension.estimated(150)

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
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        let inset = Constants.sectionInset
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: inset, bottom: 8, trailing: inset)
        section.interGroupSpacing = 20

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .make(height: Constants.headerHeight),
            elementKind: HeaderView.reuseIdentifier,
            alignment: .top
        )
        header.pinToVisibleBounds = true
        header.zIndex = Int.max
        //section.boundarySupplementaryItems = [header]

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

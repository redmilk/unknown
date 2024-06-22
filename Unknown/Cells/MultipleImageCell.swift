//
//  MultipleImageCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 14.01.2024.
//

import UIKit
import SDWebImage

final class MultipleImageCell: UICollectionViewCell {
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    struct ViewModel {
        let title: String
        let isPreviewed: Bool
        let items: [Item]
    }
    
    struct Item: HashItem {
        let hash: Int
        let viewModel: MultipleImagePreviewCell.ViewModel
    }
    
    private enum Section: Hashable, CaseIterable {
        case preview
    }
    
    private let gradientView = GradientView()
    
    private let newPackNotificationView = UIView()
    private let titleLabel = UILabel()
    private let themeLabel = UILabel()
    
    private lazy var titleStackView = UIStackView(
        arrangedSubviews: [newPackNotificationView, titleLabel]
    )
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    private lazy var layout = makeLayout()
    private lazy var diffable: DataSource = makeDataSource()
    
    private var viewModel: ViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        newPackNotificationView.isVisible = !viewModel.isPreviewed
        diffable.apply(makeSnapshot(for: viewModel))
    }
    
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, item in
                let cell = collectionView.dequeueCell(ofType: MultipleImagePreviewCell.self, for: indexPath)
                cell.update(with: item.viewModel)
                return cell
            }
        )
        return dataSource
    }
    
    private func makeSnapshot(for viewModel: ViewModel) -> Snapshot {
        var snapshot = Snapshot()
        snapshot.appendSections([.preview])
        snapshot.appendItems(viewModel.items)
        return snapshot
    }
    
    func makeLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout(
            sectionProvider: { [weak self] _, _ in
                self?.previewSection()
            }
        )
    }
    
    func previewSection() -> NSCollectionLayoutSection {
        
        let itemsInRow: Int = 3
        let defaultDimension = NSCollectionLayoutDimension.fractionalWidth(1 / CGFloat(itemsInRow))

        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: defaultDimension,
            heightDimension: defaultDimension
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: defaultDimension
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: itemsInRow)
        group.interItemSpacing = .fixed(Constants.interItemSpacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .zero

        return section
    }
}

// MARK: - Appearance

extension MultipleImageCell {
    private func configureUI() {
        clipsToBounds = true
        layer.cornerRadius = 16
        
        backgroundColor = .white.withAlphaComponent(0.1)
        
        gradientView.gradient.colors = [
            UIColor.black.withAlphaComponent(0).cgColor,
            UIColor.black.withAlphaComponent(0.9).cgColor
        ]
        gradientView.gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradientView.gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 13)//.sfProTextSemibold(ofSize: 17)
        
        collectionView.registerCell(MultipleImagePreviewCell.self)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isUserInteractionEnabled = false
        
        newPackNotificationView.backgroundColor = .ultraBlue
        newPackNotificationView.makeRounded(5)
        
        titleStackView.spacing = 4
        titleStackView.axis = .horizontal
        titleStackView.alignment = .center
        
        themeLabel.makeRounded(10)
        themeLabel.textAlignment = .center
        themeLabel.backgroundColor = .darkGray
        themeLabel.font = .systemFont(ofSize: 13)
        themeLabel.text = "label"
    }
    
    private func configureLayout() {
        contentView.addSubviews([collectionView, gradientView, titleStackView, themeLabel])
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(12)
        }
        
        newPackNotificationView.snp.makeConstraints { make in
            make.size.equalTo(10)
        }
        
        gradientView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        titleStackView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview().inset(8)
        }
        themeLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
    }
    
    enum Constants {
        static let interItemSpacing: CGFloat = 3
    }
}

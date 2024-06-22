//
//  HomeUtils.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 22.06.2024.
//

import Foundation

final class HomeUtils {
    static func makeViewModel() -> HomeCollectionView.ViewModel {
        
        let headerConfig = HeaderConfig(title: "Test Title", subtitle: "Test Subtitle", buttonTitle: "Test button", buttonLink: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!, headerContentLink: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!, isVideoHeader: false)
        let headerItem1 = HeaderCell.ViewModel(state: .empty, config: headerConfig, onGenerate: nil, hasCollections: false)
        let header = HomeCollectionView.ViewModel.Block(section: .header, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .header(headerItem1))
        ])
        
        let block1Model = ContentCell.ViewModel(title: "Test", previewUrl: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)
        let block1 = HomeCollectionView.ViewModel.Block(section: .styles, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .style(block1Model, onSelect: .nop)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .style(block1Model, onSelect: .nop)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .style(block1Model, onSelect: .nop)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .style(block1Model, onSelect: .nop)),
        ])
        
        let block2Model = block1Model
        let block2 = HomeCollectionView.ViewModel.Block(section: .themePacks, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .themePack(block2Model, onSelect: .nop)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .themePack(block2Model, onSelect: .nop)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .themePack(block2Model, onSelect: .nop)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .themePack(block2Model, onSelect: .nop)),
        ])
        
        let block3Model = MultipleImageCell.ViewModel(
            title: "Test title",
            isPreviewed: false,
            items: [
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
                MultipleImageCell.Item(hash: UUID().hashValue, viewModel: .init(url: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!)),
            ]
        )

        let block3 = HomeCollectionView.ViewModel.Block(section: .userCollections, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .userCollection(block3Model, onSelect: .nop)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .userCollection(block3Model, onSelect: .nop)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .userCollection(block3Model, onSelect: .nop)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .userCollection(block3Model, onSelect: .nop)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .userCollection(block3Model, onSelect: .nop)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .userCollection(block3Model, onSelect: .nop)),
        ])
        
        let viewModel = HomeCollectionView.ViewModel(
            blocks: [header, block3, block2, block1],
            onSeeAll: .nop,
            onScrolledToIndex: .nop
        )
        
        return viewModel
    }
}

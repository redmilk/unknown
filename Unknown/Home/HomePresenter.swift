//
//  HomePresenter.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 03.02.2024.
//

let video = URL(string: "https://samplelib.com/lib/preview/mp4/sample-5s.mp4")!

import Foundation

final class HomePresenter: Presenter {
    
    var view: HomeViewControllerIn?
    
    init() {
    }
    
    func viewDidLoad() {
        let collectionModel = makeViewModel()
        view?.update(with: .init(collectionViewModel: collectionModel))
    }
    
    func makeViewModel() -> HomeCollectionView.ViewModel {
        
        // MARK: - Block 0 - Header
        let headerConfig = HeaderConfig(title: "Test Title", subtitle: "Test Subtitle", buttonTitle: "Test button", buttonLink: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!, headerContentLink: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!, isVideoHeader: false)
        let headerItem1 = HeaderCell.ViewModel(state: .empty, config: headerConfig, onGenerate: nil, hasCollections: false)
        let header = HomeCollectionView.ViewModel.Block(section: .header, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .header(headerItem1))
        ])
        
        // MARK: - Block 1
        let block1Model = ContentCell.ViewModel(title: "Test", previewUrl: URL(string: "https://www.gstatic.com/webp/gallery/1.webp")!, onSelect: .nop)
        let block1 = HomeCollectionView.ViewModel.Block(section: .verticalDouble, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .verticalDouble(block1Model)),
        ])
        
        // MARK: - Block 2
        let block2Model = block1Model
        let block2 = HomeCollectionView.ViewModel.Block(section: .horizontal, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontal(block2Model)),
        ])
        
        // MARK: - Block 3
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
            ], 
            onSelect: .nop
        )

        let block3 = HomeCollectionView.ViewModel.Block(section: .horizontalCollections, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .horizontalCollection(block3Model)),
        ])
        
        // MARK: - Block 4
        let block4Model = ClassicQuizCell.ViewModel(state: .default, question: "How many years I continue drinking and smoking?, How many years I continue drinking and smoking?, How many years I continue drinking and smoking?, How many years I continue drinking and smoking?, How many years I continue drinking and smoking?, How many years I continue drinking and smoking?, How many years I continue drinking and smoking?, How many years I continue drinking and smoking?, How many years I continue drinking and smoking?, How many years I continue drinking and smoking?, How many years I continue drinking and smoking?, How many years I continue drinking and smoking?", asnwers: ["20", "19", "18", "17"], category: "Life", correctAnswer: "20", image: nil)
        let block4 = HomeCollectionView.ViewModel.Block(section: .classicQuiz, items: [
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .classicQuiz(block4Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .classicQuiz(block4Model)),
            HomeCollectionView.Item(hash: UUID().hashValue, kind: .classicQuiz(block4Model)),
        ])
        
        
        // MARK: - Result
        let viewModel = HomeCollectionView.ViewModel(
            blocks: [header, block4, block3, block2, block1],
            onSeeAll: .nop,
            onScrolledToIndex: .nop
        )
        
        return viewModel
    }
}

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
    
    func onViewDidLoad() {
        let viewModel = makeViewModel()
        view?.update(with: viewModel)
    }
    
    func makeViewModel() -> HomeViewController.ViewModel {
        var blocks: [HomeCollectionView.ViewModel.Block] = []
        
        let items: [HomeCollectionView.Item] = [.init(hash: UUID().hashValue, kind: .header(.init(state: .normal, config: .init(title: "Title", subtitle: "Subtitle", buttonTitle: "BUtton", buttonLink: URL(string: "")!, headerContentLink: video, isVideoHeader: true), onGenerate: nil, hasCollections: true)))]
        let block = HomeCollectionView.ViewModel.Block(section: .header, items: items)
        blocks.append(block)
        let collectionViewModel = HomeCollectionView.ViewModel(
            blocks: blocks,
            onSeeAll: .nop,
            onScrolledToIndex: .nop,
            hasAnyCollection: true,
            isThemePacksAB: false
        )
        return HomeViewController.ViewModel(collectionViewModel: collectionViewModel)
    }
}

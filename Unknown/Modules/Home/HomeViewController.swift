//
//  ViewController.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit
import SnapKit

protocol HomeViewControllerIn {
    func update(with viewModel: HomeViewController.ViewModel)
}

final class HomeViewController: BaseViewController, HomeViewControllerIn {
    enum State {
        case empty
        case loading
        case loaded
    }
    
    struct ViewModel {
        let state: State
        let collectionViewModel: HomeCollectionView.ViewModel
        static let initial = ViewModel(state: .empty, collectionViewModel: .initial)
    }
    
    private let collection = HomeCollectionView()
    private let emptyState = EmptyStateView(description: "Here is nothing, yet...")

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // configure layout here bc currently this is first and root view
    // remove when coordinator pattern added
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureLayout()
    }
    
    func update(with viewModel: ViewModel) {
        collection.update(with: viewModel.collectionViewModel)
        emptyState.isHidden = viewModel.collectionViewModel.blocks.count > 1
    }

    // MARK: - Private
    private func configureUI() {
        
    }
    
    private func configureLayout() {
        view.addSubview(collection)
        view.addSubview(emptyState)
  
        collection.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-view.safeAreaInsets.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        emptyState.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


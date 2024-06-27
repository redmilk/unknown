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
        case loading
        case loaded
    }
    
    struct ViewModel {
        let state: State
        let collectionViewModel: HomeCollectionView.ViewModel
    }
    
    private let collection = HomeCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // configure layout here bc currently this is first and root view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureLayout()
    }
    
    func update(with viewModel: ViewModel) {
        collection.update(with: viewModel.collectionViewModel)
    }

    // MARK: - Private
    private func configureView() {
        collection.update(with: .initial)
    }
    
    private func configureLayout() {
        view.addSubview(collection)
  
        collection.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-view.safeAreaInsets.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}


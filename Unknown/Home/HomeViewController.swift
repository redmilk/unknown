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
    
    struct ViewModel {
        let collectionViewModel: HomeCollectionView.ViewModel
    }
    
    private let collection = HomeCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        configureView()
    }
    
    // MARK: - HomeViewControllerInput
    func update(with viewModel: ViewModel) {
        collection.update(with: viewModel.collectionViewModel)
    }

    // MARK: - Private
    private func configureView() {
    }
    
    private func configureLayout() {
        view.addSubview(collection)
        collection.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }        
    }
}


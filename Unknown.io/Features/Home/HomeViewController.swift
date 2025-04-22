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

final class HomeViewController: UIViewController, HomeViewControllerIn {
    
    struct ViewModel {
        enum State {
            case empty
            case loading
            case loaded
        }
        
        let state: State
        let collectionViewModel: HomeCollectionView.ViewModel
        static let initial = ViewModel(state: .empty, collectionViewModel: .initial)
    }
    
    private let collection = HomeCollectionView()
    private let emptyState = EmptyStateView(description: "")
    private let emitter = ParticleEmitterView()
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

    private func configureUI() {
        view.backgroundColor = .black
        collection.backgroundColor = .clear
    }
    
    private func configureLayout() {
        view.addSubview(emitter)
        view.addSubview(collection)
        view.addSubview(emptyState)
  
        collection.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-view.safeAreaInsets.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
        emptyState.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        emitter.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


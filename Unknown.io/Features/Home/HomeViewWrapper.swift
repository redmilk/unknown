//
//  HomeViewWrapper.swift
//  Unknown.io
//
//  Created by Danyl Timofeyev on 20.04.2025.
//

import SwiftUI

struct HomeViewWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> HomeViewController {
        let viewModel = HomeViewModel()
        let controller = HomeViewController(viewModel: viewModel)
        viewModel.viewDidLoad()
        return controller
    }

    func updateUIViewController(_ uiViewController: HomeViewController, context: Context) { }
}

#Preview {
    HomeViewWrapper()
}

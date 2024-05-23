//
//  BackgroundDecorationView.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 03.02.2024.
//

import Foundation

final class BackgroundDecorationView: NoNibCollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    private func configureView() {
        backgroundColor = .black
        layer.cornerRadius = 16
        layer.masksToBounds = true
    }
}

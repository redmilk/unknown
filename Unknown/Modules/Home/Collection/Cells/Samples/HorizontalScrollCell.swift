//
//  HorizontalScrollCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 14.01.2024.
//

import UIKit
import SDWebImage

final class HorizontalScrollCell: ImageCell {
    
    struct ViewModel {
        let previewUrl: URL
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: ViewModel) {
        setImageURL(viewModel.previewUrl)
    }
}

// MARK: - Appearance

extension HorizontalScrollCell {
    private func configureUI() {
        clipsToBounds = true
        layer.cornerRadius = 32
    }
}

//
//  ContentCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit
import SDWebImage

final class ContentCell: ImageCell {
    
    struct ViewModel {
        let title: String
        let previewUrl: URL?
    }
    
    private let gradientView = GradientView()
    private let titleLabel = UILabel()
    
    private var viewModel: ViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        
        setImageURL(viewModel.previewUrl)
    }
}

// MARK: - Appearance

extension ContentCell {
    private func configureUI() {
        clipsToBounds = true
        layer.cornerRadius = 16
        
        gradientView.gradient.colors = [
            UIColor.black.withAlphaComponent(0).cgColor,
            UIColor.black.withAlphaComponent(0.9).cgColor
        ]
        gradientView.gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradientView.gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 13)//.sfProTextSemibold(ofSize: 17)
    }
    
    private func configureLayout() {
        contentView.addSubviews([gradientView, titleLabel])
        
        gradientView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview().inset(8)
        }
    }
}

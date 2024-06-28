//
//  EmptyResultsView.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 27.06.2024.
//

import UIKit.UILabel
import SDWebImage

final class EmptyStateView: NiblessView {
    
    private let descriptionLabel = UILabel()
    private let imageView = SDAnimatedImageView()
    
    init(description: String) {
        super.init()
        configureUI(description)
        configureLayout()
    }
    
    private func configureUI(_ description: String) {
        isUserInteractionEnabled = false
        descriptionLabel.text = description
        descriptionLabel.font = .systemFont(ofSize: 15, weight: .light)
        descriptionLabel.textColor = .lightGray
        
        if let url = Bundle.main.url(forResource: "searchEmptyResult", withExtension: "gif"),
           let data = try? Data(contentsOf: url) {
            imageView.image = SDAnimatedImage(data: data)
        }
    }
    
    private func configureLayout() {
        addSubview(descriptionLabel)
        addSubview(imageView)
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.2)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.35)
            make.width.equalTo(imageView.snp.height).multipliedBy(1.03)
        }
    }
}

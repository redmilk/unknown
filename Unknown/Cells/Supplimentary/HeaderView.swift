//
//  HeaderView.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 03.02.2024.
//

import UIKit

final class HeaderView: NoNibCollectionReusableView {
    
    private let headerLabel = UILabel()
    private let titleLabel = UILabel()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
}

// MARK: - Appearance

extension HeaderView {
    private func configureUI() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont.sfProDisplayBold(ofSize: 23)
        headerLabel.textColor = .lightGray
        headerLabel.font = UIFont.sfProDisplayMedium(ofSize: 13)
        backgroundColor = .black
        headerLabel.text = "Section header"
        titleLabel.text = "Title of section"
    }
    
    private func configureLayout() {
        addSubviews([headerLabel, titleLabel])
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(4)
            make.leading.equalToSuperview().inset(8)
        }
                
        headerLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.top).offset(-4)
            make.leading.equalTo(titleLabel.snp.leading)
        }
    }
}

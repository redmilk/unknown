//
//  HorizontalSectionHeader.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 14.01.2024.
//

import UIKit

final class SectionHeaderView: NoNibCollectionReusableView {
    
    private let titleLabel = UILabel()
    private let seeAllButton = UIButton(type: .system)
    
    // MARK: - Public
    
    var onSeeAll: Command?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    @objc
    private func seeAllDidTap() {
        onSeeAll?.perform()
    }
}

// MARK: - Appearance

extension SectionHeaderView {
    private func configureUI() {
        titleLabel.textColor = .white
        titleLabel.text = "L10n.Diffusion.Preview.userCollections"
        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textColor = .white
        
        seeAllButton.setTitle("L10n.Diffusion.Preview.seeAll", for: .normal)
        seeAllButton.setTitleColor(.white, for: .normal)
        seeAllButton.titleLabel?.font = .systemFont(ofSize: 13)//.sfProTextRegular(ofSize: 15)
        seeAllButton.addTarget(self, action: #selector(seeAllDidTap), for: .touchUpInside)
        
        backgroundColor = .black
    }
    
    private func configureLayout() {
        addSubviews([titleLabel, seeAllButton])
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
        }
        
        seeAllButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.firstBaseline.equalTo(titleLabel.snp.firstBaseline)
        }
    }
}

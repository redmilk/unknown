//
//  RootCategoryCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 04.07.2024.
//

import UIKit

final class RootCategoryCell: UICollectionViewCell {
    
    struct ViewModel {
        let title: String
        let subtitle: String
    }
    
    private let headerLabel = UILabel()
    private let titleLabel = UILabel()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: ViewModel) {
        headerLabel.text = viewModel.title
        titleLabel.text = viewModel.subtitle
        
    }
    
    private func configureUI() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont.sfProDisplayBold(ofSize: 23)
        headerLabel.textColor = .lightGray
        headerLabel.font = UIFont.sfProDisplayMedium(ofSize: 13)
        backgroundColor = .black
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

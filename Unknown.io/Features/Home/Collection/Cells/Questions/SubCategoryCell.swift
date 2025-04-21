//
//  CategoryCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 05.07.2024.
//

import UIKit

final class SubCategoryCell: UICollectionViewCell {
    
    struct ViewModel {
        let title: String
    }
    
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
    
    func update(with model: ViewModel) {
        titleLabel.text = model.title
    }
    
    private func configureUI() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont.sfProDisplayRegular(ofSize: 11)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        contentView.makeRounded(8)
        contentView.backgroundColor = .ultraBlue
    }
    
    private func configureLayout() {
        addSubviews([titleLabel])
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

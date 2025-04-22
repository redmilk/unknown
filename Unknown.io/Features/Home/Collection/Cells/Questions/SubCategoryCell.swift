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
        var onTap: () -> Void
    }
    
    private let titleLabel = UILabel()
    private var viewModel: ViewModel!

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
        viewModel = model
        viewModel.onTap = { [weak self] in
            model.onTap()
            self?.bounceAnimation()
        }
    }
    
    private func configureUI() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont.sfProDisplayRegular(ofSize: 11)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.minimumScaleFactor = 0.1
        titleLabel.makeRounded(8)
        titleLabel.backgroundColor = .ultraBlue
    }
    
    private func configureLayout() {
        addSubviews([titleLabel])
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(2)
        }
    }
    
    private func bounceAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.titleLabel.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.titleLabel.transform = CGAffineTransform.identity
            }
        })
    }
}

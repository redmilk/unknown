//
//  CategoryCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 03.07.2024.
//

import UIKit.UICollectionView

final class CategoryCell: UICollectionViewCell {
    
    enum State {
        case selected
        case none
    }
    
    struct ViewModel {
        let state: State
        let category: String
        let image: URL?
        let onSelect: CommandWith<(String)>
        
        static let initial: ViewModel = .init(state: .none, category: "", image: nil, onSelect: .nop)
    }
    
    private let containerStack = UIStackView()
    private let imageView = UIImageView()
    private let categoryLabel = UILabel()
    private var viewModel: ViewModel = .initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        categoryLabel.text = viewModel.category
    }
    
    private func configureView() {
        contentView.backgroundColor = .clear
        containerStack.backgroundColor = .clear
        clipsToBounds = true
        containerStack.axis = .vertical
        containerStack.spacing = 8
        categoryLabel.backgroundColor = .halfBlack
        categoryLabel.textColor = .ultraBlue
        categoryLabel.textAlignment = .center
        categoryLabel.font = Style.Font.tiny
    }
    
    private func configureLayout() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.addSubview(containerStack)
        containerStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerStack.addArrangedSubviews([
            categoryLabel,
        ])
    }
    
    @objc
    private func onSelect(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        viewModel.onSelect.perform(with: text)
    }
}

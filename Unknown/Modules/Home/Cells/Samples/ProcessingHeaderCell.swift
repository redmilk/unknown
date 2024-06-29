//
//  ProcessingCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit
import SDWebImage

final class ProcessingHeaderCell: UICollectionViewCell {
    struct ViewModel {
        let headerImageURLs: [URL?]
        let collectionsCount: Int
        let onViewAll: Command
    }
    
    let containerView = UIView()
    let backgroundStack = UIStackView()
    let backgroundLeftStack = UIStackView()
    let backgroundRightStack = UIStackView()
    let backgoundShadowView = GradientView()
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let seeAllButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func update(with viewModel: ViewModel) {
        seeAllButton.onTouchUpInside = { _ in viewModel.onViewAll.perform() }
        
        let subtitle = "subtitle"
        
        subtitleLabel.text = subtitle
        configureImageViews(with: viewModel)
    }
}

extension ProcessingHeaderCell {
    private func configureUI() {
        backgroundColor = .clear
        containerView.makeRounded(16)
        
        backgroundStack.axis = .horizontal
        backgroundStack.distribution = .fill
        backgroundStack.spacing = 14
        backgroundStack.layoutMargins = .init(top: 0, left: 6, bottom: 0, right: 6)
        backgroundStack.isLayoutMarginsRelativeArrangement = true
        backgroundStack.backgroundColor = .lightBlack
        [backgroundLeftStack, backgroundRightStack].forEach {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.spacing = 10
        }

        backgoundShadowView.gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.lightBlack.cgColor
        ]
        backgoundShadowView.gradient.startPoint = CGPoint(x: 0.5, y: 0)
        backgoundShadowView.gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        seeAllButton.backgroundColor = .ultraBlue
        seeAllButton.titleLabel?.textColor = .white
        seeAllButton.titleLabel?.font = .boldSystemFont(ofSize: 13)//.sfProTextSemibold(ofSize: 15)
        seeAllButton.makeRounded(18)
        seeAllButton.setTitle("L10n.Diffusion.ProcessingPreview.viewAll", for: .normal)
        
        titleLabel.text = "L10n.Diffusion.ProcessingPreview.avatars"
        titleLabel.font = .boldSystemFont(ofSize: 13)
        subtitleLabel.textColor = .lightGray
        subtitleLabel.font = .boldSystemFont(ofSize: 13)
    }
    
    private func configureLayout() {
        addSubview(containerView)
        containerView.addSubviews([backgroundStack, backgoundShadowView])
        backgroundStack.addArrangedSubviews([backgroundLeftStack, SDAnimatedImageView(), backgroundRightStack])
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        [backgoundShadowView, backgroundStack].forEach {
            $0.snp.makeConstraints { make in
                make.leading.top.trailing.equalToSuperview().inset(24)
                make.bottom.equalToSuperview().inset(10)
            }
        }
        
        addSubviews([titleLabel, subtitleLabel, seeAllButton])
        titleLabel.snp.makeConstraints { make in
            make.leading.bottom.equalTo(self).inset(32)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.top).offset(-6)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        seeAllButton.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(36)
            make.trailing.bottom.equalTo(self).inset(32)
        }
    }
    
    private func configureImageViews(with viewModel: ViewModel) {
        let midImageViewIndex = 1
        let midImageIndex = 2
        let requiredImagesCount = 5
        
        guard let imageView = backgroundStack.arrangedSubviews[safe: midImageViewIndex] as? SDAnimatedImageView,
              viewModel.headerImageURLs.count >= requiredImagesCount else {
            return
        }

        backgroundLeftStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        imageView.sd_setImage(with: viewModel.headerImageURLs[midImageIndex], completed: nil)
        imageView.contentMode = .scaleAspectFill
        imageView.makeRounded(15)
        backgroundRightStack.arrangedSubviews.forEach { $0.removeFromSuperview() }

        viewModel.headerImageURLs.enumerated().forEach { index, imageURL in
            guard index < midImageIndex else { return }
            let imageView = SDAnimatedImageView()
            imageView.sd_setImage(with: imageURL, completed: nil)
            backgroundLeftStack.addArrangedSubview(imageView)
        }
        viewModel.headerImageURLs.enumerated().forEach { index, imageURL in
            guard index > midImageIndex else { return }
            let imageViewRight = SDAnimatedImageView()
            imageViewRight.sd_setImage(with: imageURL, completed: nil)
            backgroundRightStack.addArrangedSubview(imageViewRight)
        }
        
        (backgroundLeftStack.arrangedSubviews + backgroundRightStack.arrangedSubviews).forEach {
            ($0 as? SDAnimatedImageView)?.contentMode = .scaleAspectFill
            $0.makeRounded(15)
            $0.snp.makeConstraints { make in
                make.width.height.equalTo(70)
            }
        }
    }
}

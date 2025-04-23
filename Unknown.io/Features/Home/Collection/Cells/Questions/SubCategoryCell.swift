//
//  CategoryCell.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 05.07.2024.
//

import UIKit

final class SubCategoryCell: UICollectionViewCell {
    struct ViewModel {
        enum State {
            case isLoading
            case `default`
        }
        
        let state: State
        let title: String
        var onTap: () -> Void
    }
    
    private let titleLabel = UILabel()
    private let activity = CirclesActivityIndicatorFactory.make(height: Constants.activityHeight)
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
        switch model.state {
        case .isLoading:
            startLoading()
        case .default:
            stopLoading()
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
    
    private func startLoading() {
        bounceAnimation()
        addSubview(activity)
        isUserInteractionEnabled = false
        layer.cornerRadius = Constants.activityHeight / 2
        activity.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(Constants.activityHeight)
            make.width.equalTo(Constants.activityHeight)
        }
    }
    
    private func stopLoading() {
        activity.removeFromSuperview()
        isUserInteractionEnabled = true
        layer.cornerRadius = Constants.activityHeight / 2
    }
    
    func bounceAnimation() {
        UIView.animate(withDuration: 0.05, animations: {
            self.titleLabel.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { _ in
            UIView.animate(
                withDuration: 0.15,
                delay: 0,
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 6,
                options: .curveEaseOut,
                animations: {
                    self.titleLabel.transform = .identity
                }, completion: nil)
        })
    }
    
    private enum Constants {
        static let activityHeight: CGFloat = 40
    }
}

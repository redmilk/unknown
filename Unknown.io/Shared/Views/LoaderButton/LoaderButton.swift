//
//  LoaderButton.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 25.06.2024.
//

import UIKit.UIButton
import SnapKit

final class LoaderButton: UIButton {
    private enum Constants {
        static let height: CGFloat = 20
        static let width: CGFloat = 100
    }
    
    private var activityIndicator: UIView!
    
    init(title: String) {
        super.init(frame: .zero)
        configure(title: title)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        fatalError()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    private func configure(title: String) {
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        activityIndicator = CirclesActivityIndicatorFactory.make(height: Constants.height)
        contentEdgeInsets = .init(top: 4, left: 8, bottom: 4, right: 8)
    }
    
    func startLoading() {
        addSubview(activityIndicator)
        setTitleColor(UIColor.clear, for: .normal)
        isUserInteractionEnabled = false
        layer.cornerRadius = Constants.height / 2
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(Constants.height)
            make.width.equalTo(Constants.width)
        }
    }
    
    func stopLoading() {
        activityIndicator.removeFromSuperview()
        setTitleColor(UIColor.white, for: .normal)
        isUserInteractionEnabled = true
        layer.cornerRadius = Constants.height / 2
    }
}

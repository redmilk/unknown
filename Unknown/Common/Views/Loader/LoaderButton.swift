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
        static let width: CGFloat = 40
        static let loadindWidth: CGFloat = 20
        static let title = "➕"
    }
    
    private var activityIndicator: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(Constants.title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 13, weight: .light)
        activityIndicator = CirclesActivityIndicatorFactory.make(height: Constants.height)
        contentEdgeInsets = .init(top: 4, left: 8, bottom: 4, right: 8)
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
            make.width.equalTo(Constants.width)
        }
    }
    
    func startLoading() {
        addSubview(activityIndicator)
        setTitleColor(UIColor.clear, for: .normal)
        isUserInteractionEnabled = false
        layer.cornerRadius = Constants.height / 2
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(Constants.height)
        }
        snp.remakeConstraints { make in
            make.height.equalTo(Constants.height)
            make.width.equalTo(Constants.loadindWidth)
        }
    }
    
    func stopLoading() {
        activityIndicator.removeFromSuperview()
        setTitleColor(UIColor.white, for: .normal)
        isUserInteractionEnabled = true
        layer.cornerRadius = Constants.height / 2
        snp.remakeConstraints { make in
            make.height.equalTo(Constants.height)
            make.width.equalTo(Constants.width)
        }
    }
}

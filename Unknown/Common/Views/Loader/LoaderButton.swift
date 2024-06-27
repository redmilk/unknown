//
//  LoaderButton.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 25.06.2024.
//

import UIKit.UIButton
import SnapKit

final class LoaderButton: UIButton {
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
        activityIndicator = CirclesActivityIndicatorFactory.make(height: 20)
        contentEdgeInsets = .init(top: 4, left: 8, bottom: 4, right: 8)
    }
    
    func startLoading() {
        setTitleColor(UIColor.clear, for: .normal)
        isUserInteractionEnabled = false
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(20)
        }
    }
    
    func stopLoading() {
        activityIndicator.removeFromSuperview()
        setTitleColor(UIColor.white, for: .normal)
        isUserInteractionEnabled = true
    }
}

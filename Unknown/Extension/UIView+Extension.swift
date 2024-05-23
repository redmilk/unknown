//
//  UIView+Extension.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit

extension UIView {
    func makeRounded(_ radius: CGFloat? = nil, corners: CACornerMask? = nil) {
        if let maskedCorners = corners {
            layer.maskedCorners = maskedCorners
        }
        layer.cornerRadius = radius ?? frame.height / 2
        layer.masksToBounds = true
    }

    func addShadow(
        color: UIColor = .black,
        opacity: Float = 1,
        radius: CGFloat = 8,
        offset: CGSize = .zero
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
    }
    
    func addTopInnerShadow(radius: CGFloat) {
        let toColor = UIColor(white: 0, alpha: 0)
        let fromColor = UIColor(white: 0, alpha: 1)

        let viewFrame = self.frame
        let gradientlayer = CAGradientLayer()
        gradientlayer.colors = [fromColor.cgColor, toColor.cgColor]
        gradientlayer.shadowRadius = radius

        gradientlayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientlayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientlayer.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: gradientlayer.shadowRadius)
        self.layer.addSublayer(gradientlayer)
    }
    
    func addBottomInnerShadow(radius: CGFloat, height: CGFloat) {
        let toColor = UIColor(white: 0, alpha: 1)
        let fromColor = UIColor(white: 0, alpha: 0)

        let viewFrame = self.frame
        let gradientlayer = CAGradientLayer()
        gradientlayer.colors = [fromColor.cgColor, toColor.cgColor]
        gradientlayer.shadowRadius = radius

        gradientlayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientlayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientlayer.frame = CGRect(x: 0.0, y: height - gradientlayer.shadowRadius, width: viewFrame.width, height: gradientlayer.shadowRadius)
        self.layer.addSublayer(gradientlayer)
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach(addSubview)
    }
    
    var isVisible: Bool {
        get { !isHidden }
        set { isHidden = !newValue }
    }
}

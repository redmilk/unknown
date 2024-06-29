//
//  Fonts.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 14.01.2024.
//

import UIKit.UIFont

enum FontName {
    static let sfProDisplayRegular = "SFProDisplay-Regular"
    static let sfProDisplayMedium = "SFProDisplay-Medium"
    static let sfProDisplayBold = "SFProDisplay-Bold"
    static let sfProDisplayBlack = "SFProDisplay-Black"
    static let sfProDisplaySemibold = "SFProDisplay-Semibold"
}

extension UIFont {
    
    // MARK: - SFPro-Display
    
    class func sfProDisplayRegular(ofSize size: CGFloat) -> UIFont? {
        UIFont(name: FontName.sfProDisplayRegular, size: size)
    }

    class func sfProDisplayMedium(ofSize size: CGFloat) -> UIFont? {
        UIFont(name: FontName.sfProDisplayMedium, size: size)
    }

    class func sfProDisplayBold(ofSize size: CGFloat) -> UIFont? {
        UIFont(name: FontName.sfProDisplayBold, size: size)
    }

    class func sfProDisplayBlack(ofSize size: CGFloat) -> UIFont? {
        UIFont(name: FontName.sfProDisplayBlack, size: size)
    }

    class func sfProDisplaySemibold(ofSize size: CGFloat) -> UIFont? {
        UIFont(name: FontName.sfProDisplaySemibold, size: size)
    }
}

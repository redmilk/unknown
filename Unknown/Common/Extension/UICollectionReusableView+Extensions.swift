//
//  UICollectionReusableView+Extensions.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 14.01.2024.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String { className }
}

extension UITableViewCell {
    static var reuseIdentifier: String { className }
}

extension UITableViewHeaderFooterView {
    static var reuseIdentifier: String { className }
}

private extension NSObject {
    static var className: String { String(describing: Self.self) }
}

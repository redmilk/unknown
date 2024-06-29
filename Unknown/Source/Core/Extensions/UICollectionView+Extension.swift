//
//  UICollectionView+Extension.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 14.01.2024.
//

import UIKit

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(_ cell: T.Type) {
        register(cell, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }

    func registerSupplementary<T: UICollectionReusableView>(_ supplementary: T.Type) {
        register(
            supplementary,
            forSupplementaryViewOfKind: supplementary.reuseIdentifier,
            withReuseIdentifier: supplementary.reuseIdentifier
        )
    }

    func dequeueCell<T: UICollectionViewCell>(
        ofType type: T.Type,
        for indexPath: IndexPath
    ) -> T {
        dequeueReusableCell(
            withReuseIdentifier: type.reuseIdentifier,
            for: indexPath
        ) as! T
    }

    func dequeueSupplementary<T: UICollectionReusableView>(
        ofType type: T.Type,
        for indexPath: IndexPath
    ) -> T {
        dequeueReusableSupplementaryView(
            ofKind: type.reuseIdentifier,
            withReuseIdentifier: type.reuseIdentifier,
            for: indexPath
        ) as! T
    }
}

extension UITableView {
    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ headerFooter: T.Type) {
        register(
            headerFooter,
            forHeaderFooterViewReuseIdentifier: headerFooter.reuseIdentifier
        )
    }

    func dequeueCell<T: UITableViewCell>(
        ofType type: T.Type,
        for indexPath: IndexPath
    ) -> T {
        dequeueReusableCell(
            withIdentifier: type.reuseIdentifier,
            for: indexPath
        ) as! T
    }

    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(ofType type: T.Type) -> T {
        dequeueReusableHeaderFooterView(withIdentifier: type.reuseIdentifier) as! T
    }
}

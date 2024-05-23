//
//  HashItem.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import Foundation

protocol HashItem: Hashable {
    var hash: Int { get }
}

extension HashItem {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hash == rhs.hash
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hash)
    }
}

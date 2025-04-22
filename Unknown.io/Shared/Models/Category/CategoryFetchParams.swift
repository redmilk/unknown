//
//  CategoryFetchParams.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 02.07.2024.
//

import Foundation

struct CategoryFetchParams: Encodable {
    let numberOfCategories: Int
    let rootCategory: String
    
    static let initial = CategoryFetchParams(numberOfCategories: 54, rootCategory: "Space and Astronomy")
}

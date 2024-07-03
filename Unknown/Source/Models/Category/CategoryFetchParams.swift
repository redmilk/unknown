//
//  CategoryFetchParams.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 02.07.2024.
//

import Foundation

struct CategoryFetchParams: Encodable {
    let numberOfCategories: Int
    let numberOfSubCategories: Int
    let rootCategory: String
    
    static let initial = CategoryFetchParams(numberOfCategories: 5, numberOfSubCategories: 5, rootCategory: "Space")
}

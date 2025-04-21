//
//  QuizCategoryDTO.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 02.07.2024.
//

import Foundation

struct CategoryRootDTO: Decodable {
    let rootCategory: String
    let description: String
    let categories: [CategoryDTO]
}

struct CategoryDTO: Decodable {
    let title: String
}

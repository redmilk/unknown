//
//  CategoryModel.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 02.07.2024.
//

import Foundation

struct CategoryRootModel {
    let title: String
    let description: String
    let subCategories: [CategoryModel]
    
    init(dto: CategoryRootDTO) {
        title = dto.rootCategory
        description = dto.description
        subCategories = dto.categories.map(CategoryModel.init)
    }
}

struct CategoryModel {
    let title: String
    
    init(dto: CategoryDTO) {
        title = dto.title
    }
}

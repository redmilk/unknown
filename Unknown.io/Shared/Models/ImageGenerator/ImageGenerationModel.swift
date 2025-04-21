//
//  ImageModel.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 16.07.2024.
//

import Foundation

struct ImageGenerationModel {
    var imageURLs: [URL] = []
 
    init(dto: ImageGenerationDTO) {
        dto.data.forEach { data in
            imageURLs.append(URL(string: data.url)!)
        }
    }
}

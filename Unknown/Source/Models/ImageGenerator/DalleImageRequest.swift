//
//  ImageGeneratorModel.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 16.07.2024.
//

import Foundation

struct ImageGenerationFetchParams: Encodable {
    let model: String
    let style: String
    let quality: String
    let prompt: String
    let n: Int
    let size: String
    
    static let initial = ImageGenerationFetchParams(model: "", style: "", quality: "", prompt: "prompt", n: 1, size: "")
}

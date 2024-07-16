//
//  ImageGeneratorModel.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 16.07.2024.
//

import Foundation

struct DalleImageFetchParams: Encodable {
    let prompt: String
    let n: Int
    let size: String
    
    static let initial = DalleImageFetchParams(prompt: "", n: 1, size: "")
}

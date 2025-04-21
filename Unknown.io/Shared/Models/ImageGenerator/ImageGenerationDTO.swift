//
//  DalleImageResponse.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 16.07.2024.
//

import Foundation

struct ImageGenerationDTO: Decodable {
    struct Data: Decodable {
        let url: String
    }
    let data: [Data]
}

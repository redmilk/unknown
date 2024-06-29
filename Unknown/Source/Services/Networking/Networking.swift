//
//  Networking.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 23.05.2024.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
    case HEAD = "HEAD"
}

protocol URLRequestAdaptable {
    func adapt(_ urlRequest: inout URLRequest)
}

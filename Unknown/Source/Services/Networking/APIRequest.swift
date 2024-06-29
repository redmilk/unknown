//
//  ApiRequest.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 31.05.2024.
//

import UIKit
import Alamofire

struct APIRequest: URLRequestConvertible {
    
    init(resourceUrl: URL) {
        self.init(method: .GET, endpoint: nil)
        self.resourceUrl = resourceUrl
    }
    
    init(
        method: HTTPMethod,
        endpoint: String?,
        queryItems: [String: String]? = nil,
        headers: [String : String]? = nil,
        parameters: Parameters? = nil,
        body: Data? = nil
    ) {
        self.method = method
        self.endpoint = endpoint
        self.queryItems = queryItems
        self.headers = headers
        self.parameters = parameters
        self.body = body
    }
    
    var resourceUrl: URL?
    let method: HTTPMethod
    let endpoint: String?
    let queryItems: [String: String]?
    var headers: [String: String]?
    var parameters: Parameters?
    var body: Data?
    //let environment = CardsAssembler.container.resolve(CardsEnvironment.self)!
    // instead baseUrl (baseURL should come from environment)
    let baseURL = "https://api.openai.com"
    
    public func asURLRequest() throws -> URLRequest {
        let url = try resourceUrl ?? buildUrl()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        buildHeaders().forEach { (key: String, value: String) in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        headers?.forEach { (key: String, value: String) in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        if let parameters = parameters {
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        } else {
            urlRequest.httpBody = body
        }
        return urlRequest
    }
    
    private func buildUrl() throws -> URL {
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw APIError.badRequest
        }
        if let endpoint = endpoint {
            urlComponents.path = (urlComponents.path as NSString).appendingPathComponent(endpoint)
        }
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems.map { URLQueryItem(name: $0, value: $1) }
        }
        guard let url = urlComponents.url else {
            throw APIError.badRequest
        }
        return url
    }
    
    private enum Constants {
        static let iOSVersion = UIDevice.current.systemVersion
        static let appVersion = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "0.0.0"
    }

    private func buildHeaders() -> [String: String] {
        var headers = [String: String]()
//        if let environment = CardsAssembler.container.resolve(CardsEnvironment.self) {
//            headers["User-Agent"] = "\(environment.appName)/\(Constants.appVersion) (iOS/\(Constants.iOSVersion))"
//            headers = headers.merging(environment.legacyUatRedirectHeader) { (_, new) in new }
//        }
        headers["X-CBH-CORRELATION-ID"] = NSUUID().uuidString
        return headers
    }
    
}

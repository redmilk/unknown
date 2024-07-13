//
//  APIClient.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 23.05.2024.
//

import Foundation
import Alamofire

let video = URL(string: "https://samplelib.com/lib/preview/mp4/sample-5s.mp4")!

protocol APIClient {
    
}

enum DalleImageError: Error {
    case networkError(Error)
    case noImageData
}

struct DalleImageRequest: Encodable {
    let prompt: String
    let n: Int
    let size: String
}

struct DalleImageResponse: Decodable {
    struct Data: Decodable {
        let url: String
    }
    let data: [Data]
}

final class APIClientImpl: APIClient {
    
    static let shared = APIClientImpl()
    private init() { }

    func requestDalleImages(prompt: String, imageCount: Int, imageSize: String) async -> Result<[String], DalleImageError> {
        let url = "https://api.openai.com/v1/images/generations"
        let body = DalleImageRequest(prompt: prompt, n: imageCount, size: imageSize)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(ProcessInfo.processInfo.environment["GPT_API_KEY"]!)",
            "Content-Type": "application/json"
        ]

        let dataRequest = AF.request(url, method: .post, parameters: body, encoder: .json, headers: headers)
        
        return await withCheckedContinuation { continuation in
            dataRequest
                .validate()
                .responseDecodable(of: DalleImageResponse.self) { response in
                    switch response.result {
                    case .success(let response):
                        let imageUrls = response.data.map { $0.url }
                        if !imageUrls.isEmpty {
                            continuation.resume(returning: .success(imageUrls))
                        } else {
                            continuation.resume(returning: .failure(.noImageData))
                        }
                    case .failure(let error):
                        print("Error requesting DALL-E images: \(error.localizedDescription)")
                        continuation.resume(returning: .failure(.networkError(error)))
                    }
                }
        }
    }
    
    func getCategories(messages: [Message], completion: @escaping (CategoryRootModel?) -> Void) {
        let url = "https://api.openai.com/v1/chat/completions"
        let openAIMessages = messages.map { OpenAIChatMessage(role: $0.role, content: $0.content) }
        let body = OpenAIChatBody(
            model: "gpt-3.5-turbo",
            messages: openAIMessages,
            response_format: .init(type: "json_object"))
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(ProcessInfo.processInfo.environment["GPT_API_KEY"]!)",
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .post, parameters: body, encoder: .json, headers: headers)
            .validate()
            .responseDecodable(of: OpenAIChatResponse.self) { [weak self] response in
                switch response.result {
                case .success(let response):
                    let jsonString = response.choices.first?.message.content ?? ""
                    print(jsonString)
                    if let jsonData = jsonString.data(using: .utf8) {
                        do {
                            let container = try JSONDecoder().decode(CategoryRootDTO.self, from: jsonData)
                            //FirestoreClient.shared.uploadCategoryRoot(container)
                            print(jsonString)
                            print(container.categories.count)
                            completion(CategoryRootModel(dto: container))
                            
                        } catch let error {
                            self?.checkIfDecodingError(error)
                            completion(nil)
                        }
                    } else {
                        print("Failed to convert JSON string to Data.")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func getClassicQuizModels(messages: [Message], completion: @escaping ([ClassicQuizModel]?) -> Void) {
        let url = "https://api.openai.com/v1/chat/completions"
        let openAIMessages = messages.map { OpenAIChatMessage(role: $0.role, content: $0.content) }
        let body = OpenAIChatBody(
            model: "gpt-3.5-turbo",
            messages: openAIMessages,
            response_format: .init(type: "json_object"))
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(ProcessInfo.processInfo.environment["GPT_API_KEY"]!)",
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .post, parameters: body, encoder: .json, headers: headers)
            .validate()
            .responseDecodable(of: OpenAIChatResponse.self) { [weak self] response in
                switch response.result {
                case .success(let response):
                    let jsonString = response.choices.first?.message.content ?? ""
                    if let jsonData = jsonString.data(using: .utf8) {
                        do {
                            let container = try JSONDecoder().decode(ClassicQuizDTO.self, from: jsonData)
                            print(jsonString)
                            let models = container.questions.map {
                                ClassicQuizModel(dto: $0, category: container.category, imageURL: nil, answerState: .default)
                            }
                            completion(models)
                        } catch let error {
                            self?.checkIfDecodingError(error)
                            completion(nil)
                        }
                    } else {
                        print("Failed to convert JSON string to Data.")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    private func checkIfDecodingError(_ error: Error) {
        guard error is DecodingError else { return }
        switch error {
        case DecodingError.dataCorrupted(let context):
            print(context)
        case DecodingError.keyNotFound(let key, let context):
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        case DecodingError.valueNotFound(let value, let context):
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        case DecodingError.typeMismatch(let type, let context):
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        default:
            print("Failed to convert JSON string to Data")
        }
    }
}

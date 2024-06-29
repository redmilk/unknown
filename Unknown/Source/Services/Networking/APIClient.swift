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

final class APIClientImpl: APIClient {
    
    static let shared = APIClientImpl()
    private init() { }
    
    func sendMessage(messages: [Message], completion: @escaping ([ClassicQuizModel]?) -> Void) {

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
            .responseDecodable(of: OpenAIChatResponse.self) { response in
                switch response.result {
                case .success(let response):
                    let jsonString = response.choices.first?.message.content ?? ""
                    if let jsonData = jsonString.data(using: .utf8) {
                        do {
                            let container = try JSONDecoder().decode(ClassicQuizDTO.self, from: jsonData)
                            print(jsonString)
                            let models = container.questions.map {
                                ClassicQuizModel(dto: $0, category: container.category, answerState: .default)
                            }
                            completion(models)
                        } catch let DecodingError.dataCorrupted(context) {
                            print(context)
                        } catch let DecodingError.keyNotFound(key, context) {
                            print("Key '\(key)' not found:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch let DecodingError.valueNotFound(value, context) {
                            print("Value '\(value)' not found:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch let DecodingError.typeMismatch(type, context) {
                            print("Type '\(type)' mismatch:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch {
                            print("Failed to decode JSON: \(error.localizedDescription)")
                        }
                    } else {
                        print("Failed to convert JSON string to Data.")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}

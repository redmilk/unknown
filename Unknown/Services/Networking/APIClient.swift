//
//  APIClient.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 23.05.2024.
//

import Foundation
import Alamofire

protocol APIClient {
    
}

final class APIClientImpl: APIClient {
    
    static let shared = APIClientImpl()
    private init() { }
    
    
}



import Alamofire

struct ChatGPTResponse: Decodable {
    let id: String
    let object: String
    let created: Int
    let model: String
    let choices: [Choice]

    struct Choice: Decodable {
        let text: String
        let index: Int
        let logprobs: String?
        let finish_reason: String
    }
}

func sendMessage(messages: [Message], completion: @escaping () -> Void) {

    let url = "https://api.openai.com/v1/chat/completions"
    let openAIMessages = messages.map { OpenAIChatMessage(role: $0.role, content: $0.content) }
    let body = OpenAIChatBody(
        model: "gpt-3.5-turbo",
        messages: openAIMessages,
        response_format: .init(type: "json_object"))
    let headers: HTTPHeaders = [
        "Authorization": "Bearer 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",
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
                        let decoder = JSONDecoder()
                        let quizQuestion = try decoder.decode(ClassicQuizDTO.self, from: jsonData)
                        print(quizQuestion)
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
                print("🔈 \(response.choices.first?.message.content ?? "")")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
}

struct OpenAIChatBody: Codable {
    let model: String
    let messages: [OpenAIChatMessage]
    let response_format: OpenAIResponseFormat
}

struct OpenAIResponseFormat: Codable {
    let type: String
}

struct OpenAIChatMessage: Codable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}

struct OpenAIChatResponse: Codable {
    let choices: [OpenAIChatChoice]
}

struct OpenAIChatChoice: Codable {
    let message: OpenAIChatMessage
}

struct Message: Codable {
    let id: UUID
    let role: SenderRole
    let content: String
    let createdAt: Date
}

// MARK: - Classic Quiz Response

struct ClassicQuizDTO: Codable {
    let questions: [ClassicQuizQuestionDTO]
}

// MARK: - Question
struct ClassicQuizQuestionDTO: Codable {
    let id: String
    let category: String
    let question: String
    let answers: [String]
    let correctAnswer: String
}

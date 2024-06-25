//
//  Models.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 25.06.2024.
//

import Foundation

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
    let category: String
    let questions: [ClassicQuizQuestionDTO]
}

// MARK: - Question
struct ClassicQuizQuestionDTO: Codable {
    let question: String
    let answers: [String]
    let correctAnswer: String
    let answerExplanation: String
}

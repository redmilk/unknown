//
//  ClassicQuizDTO.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 02.07.2024.
//

import Foundation

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
    let facts: [String]
}

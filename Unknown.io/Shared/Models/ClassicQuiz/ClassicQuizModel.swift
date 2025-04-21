//
//  ClassicQuizModel.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 26.06.2024.
//

import Foundation

final class ClassicQuizModel: Encodable {
    var answerState: AnswerState
    
    let id: String
    var imageURL: URL?
    let question: String
    let category: String
    let answers: [String]
    let correctAnswer: String
    let answerExplanation: String
    let facts: [String]
    
    init(
        dto: ClassicQuizQuestionDTO,
        category: String,
        imageURL: URL?,
        answerState: AnswerState
    ) {
        self.id = UUID().uuidString
        self.imageURL = imageURL
        self.question = dto.question
        self.category = category
        self.answers = dto.answers
        self.correctAnswer = dto.correctAnswer
        self.answerExplanation = dto.answerExplanation
        self.answerState = answerState
        self.facts = dto.facts
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case question
        case category
        case answers
        case correctAnswer
        case answerExplanation
        case facts
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(question, forKey: .question)
        try container.encode(category, forKey: .category)
        try container.encode(answers, forKey: .answers)
        try container.encode(correctAnswer, forKey: .correctAnswer)
        try container.encode(answerExplanation, forKey: .answerExplanation)
        try container.encode(facts, forKey: .facts)
        // Do not encode answerState
    }
}

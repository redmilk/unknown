//
//  ClassicQuizModel.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 26.06.2024.
//

import Foundation

final class ClassicQuizModel {
    var answerState: AnswerState
    
    let id: String
    let question: String
    let category: String
    let answers: [String]
    let correctAnswer: String
    let answerExplanation: String
    
    init(dto: ClassicQuizQuestionDTO, category: String, answerState: AnswerState) {
        self.id = UUID().uuidString
        self.question = dto.question
        self.category = category
        self.answers = dto.answers
        self.correctAnswer = dto.correctAnswer
        self.answerExplanation = dto.answerExplanation
        self.answerState = answerState
    }
}

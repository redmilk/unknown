//
//  AnswerState.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 26.06.2024.
//

import Foundation

enum AnswerState: Encodable {
    case `default`
    case right
    case wrong(String)
    
    init(answer: String, correctAnswer: String) {
        self = answer == correctAnswer ? .right : .wrong(answer)
    }
}

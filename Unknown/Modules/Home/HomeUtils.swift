//
//  HomeUtils.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 25.06.2024.
//

import Foundation

final class HomeUtils {

    static var quiz: ClassicQuizDTO {
        ClassicQuizDTO(
            category: "Swift Programming Language",
            questions: [
                ClassicQuizQuestionDTO(
                    question: "What is the main programming paradigm of Swift?",
                    answers: ["123456789012345678", "12345678901234567", "Functional", "Logical", "Imperative", "Declarative"],
                    correctAnswer: "Object-Oriented",
                    answerExplanation: "Swift is primarily an Object-Oriented programming language."
                ),
                ClassicQuizQuestionDTO(
                    question: "What is the keyword used to declare a constant in Swift?",
                    answers: ["const", "var", "let", "stati", "final", "const"],
                    correctAnswer: "let",
                    answerExplanation: "In Swift, constants are declared using the 'let' keyword."
                ),
                ClassicQuizQuestionDTO(
                    question: "Which type of collection is indexed and ordered in Swift?",
                    answers: ["Dictionary", "Set", "Array", "Tuple", "List", "Map"],
                    correctAnswer: "Array",
                    answerExplanation: "Arrays in Swift are indexed and ordered collections."
                ),
                ClassicQuizQuestionDTO(
                    question: "What symbol is used to represent nil or null in Swift?",
                    answers: ["undefined", "none", "empty", "null", "nil", "void"],
                    correctAnswer: "nil",
                    answerExplanation: "In Swift, 'nil' is used to represent absence of a value."
                ),
                ClassicQuizQuestionDTO(
                    question: "What is the keyword used to define a closure in Swift?",
                    answers: ["func", "closure", "init", "block", "let", "lambda"],
                    correctAnswer: "let",
                    answerExplanation: "Closures in Swift are defined using the 'let' keyword."
                ),
                ClassicQuizQuestionDTO(
                    question: "Which keyword is used to define a class in Swift?",
                    answers: ["class", "struct", "new", "instance", "object", "type"],
                    correctAnswer: "class",
                    answerExplanation: "Classes in Swift are defined using the 'class' keyword."
                ),
                ClassicQuizQuestionDTO(
                    question: "What is the keyword used to mark a method override in Swift?",
                    answers: ["override", "implement", "inherit", "redefine", "reimplement", "overload"],
                    correctAnswer: "override",
                    answerExplanation: "To mark a method as an override in Swift, you use the 'override' keyword."
                ),
                ClassicQuizQuestionDTO(
                    question: "Which type of loop is available in Swift that will loop at least once before checking the condition?",
                    answers: ["for-in", "while", "repeat-while", "do-while", "loop", "until"],
                    correctAnswer: "repeat-while",
                    answerExplanation: "The 'repeat-while' loop in Swift will always execute at least once before checking the condition."
                ),
                ClassicQuizQuestionDTO(
                    question: "What is the Swift equivalent of a nil coalescing operator in Objective-C?",
                    answers: ["??", "?:", "?:", "?.", "?!", "!!"],
                    correctAnswer: "??",
                    answerExplanation: "The nil coalescing operator in Swift is represented by '??'."
                ),
                ClassicQuizQuestionDTO(
                    question: "Which type of access control keyword in Swift restricts the use of a class, structure, or enumeration to within the defining source file?",
                    answers: ["public", "private", "fileprivate", "internal", "protected", "sourceprivate"],
                    correctAnswer: "fileprivate",
                    answerExplanation: "The 'fileprivate' keyword restricts access to the defining source file in Swift."
                )
            ]
        )
    }

}

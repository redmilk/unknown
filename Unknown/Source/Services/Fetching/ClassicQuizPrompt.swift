//
//  ClassicQuizPrompt.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 28.06.2024.
//

import Foundation

enum Prompts {
    static func getClassicQuiz(params: ClassicQuizFetchParams) -> String {
        let quiz = """
        Generate a JSON object containing \(params.questionsCount) unique questions for a quiz game in the category \(params.categoryName). 
        Each question should have \(params.answersCount) answers and the only one must be correct while others are wrong.
        Questions content must be in \(params.localization) language.
        
        The JSON should have the following structure:

        - Root object with properties:
          1. `category` (string): the name of the category. Must be in \(params.localization) language.
          2. `questions` (array): an array of question objects.

        Each question object should have the following properties:
          - `question` (string): the text of the question. Must be in \(params.localization) language.
          - `answers` (array of strings): \(params.answersCount) possible answers. Must be in \(params.localization) language. No duplicates.
          - `correctAnswer` (string): the correct answer. Must be in \(params.localization) language.
          - `answerExplanation` (string): well detailed explanation of the correct answer and some curious facts. Must be in \(params.localization) language.
          - `facts` (array of strings): 10 interesting facts about answer or question itself.

        Example JSON structure:

        ```json
        {
          "category": "Science",
          "questions": [
            {
              "question": "What is the chemical symbol for water?",
              "answers": ["H2O", "O2", "CO2", "H2SO4", "NaCl", "C6H12O6"],
              "correctAnswer": "H2O",
              "answerExplanation": "Water is composed of two hydrogen atoms and one oxygen atom, hence its chemical symbol is H2O."
            },
            {
              "question": "Which planet is known as the Red Planet?",
              "answers": ["Earth", "Venus", "Mars", "Jupiter", "Saturn", "Neptune"],
              "correctAnswer": "Mars",
              "answerExplanation": "Mars is known as the Red Planet due to its reddish appearance, which is caused by iron oxide on its surface."
            }
            // Add 8 more questions in a similar format
          ]
        }

        """
        return quiz
    }
}

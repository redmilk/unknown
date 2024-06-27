//
//  APIClient.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 23.05.2024.
//

import Foundation
import Alamofire

let video = URL(string: "https://samplelib.com/lib/preview/mp4/sample-5s.mp4")!

enum Prompts {
    static func getClassicQuiz(category: String, answersCount: String, difficulty: String = "") -> String {
        let quiz = """
        Generate a JSON object containing 10 unique questions for a quiz game in the category \(category). Each question should have \(answersCount) answers and the only one must be correct while others are wrong. The JSON should have the following structure:

        - Root object with properties:
          1. `category` (string): the name of the category.
          2. `questions` (array): an array of question objects.

        Each question object should have the following properties:
          - `question` (string): the text of the question.
          - `answers` (array of strings): \(answersCount) possible answers.
          - `correctAnswer` (string): the correct answer.
          - `answerExplanation` (string): well detailed explanation of the correct answer and some curious facts.

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

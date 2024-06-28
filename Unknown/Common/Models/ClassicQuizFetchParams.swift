//
//  ClassicQuizFetchParams.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 28.06.2024.
//

import Foundation

struct ClassicQuizFetchParams {
    enum Localization {
        case en
        case ru
        case ua
        case other(String)
        
        var value: String {
            switch self {
            case .en: return "English"
            case .ru: return "Russian"
            case .ua: return "Ukrainian"
            case .other(let language): return language
            }
        }
    }
    let categoryName: String
    let answersCount: Int
    let questionsCount: Int
    let localization: Localization
    
    static let initial = ClassicQuizFetchParams(
        categoryName: AppConstants.ClassicQuiz.initialCategory,
        answersCount: AppConstants.ClassicQuiz.initialAnswersCount,
        questionsCount: AppConstants.ClassicQuiz.initialQuestionsCount, 
        localization: AppConstants.ClassicQuiz.initialLocalization
    )
}

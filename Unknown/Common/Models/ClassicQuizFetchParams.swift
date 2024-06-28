//
//  ClassicQuizFetchParams.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 28.06.2024.
//

import Foundation

struct ClassicQuizFetchParams {
    enum Localization: String {
        case en = "English"
        case ru = "Russian"
        case ua = "Ukrainian"
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

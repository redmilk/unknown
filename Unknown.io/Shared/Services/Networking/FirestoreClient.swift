//
//  FirestoreClient.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 30.06.2024.
//

import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        
        guard let dictionary = jsonObject as? [String: Any] else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to convert JSON object to dictionary"])
        }
        
        return dictionary
    }
}

final class FirestoreClient {
    private enum Constants {
        /// TODO: - Move to remote config
        static let pathClassicQuizEnglish = "classic-quiz-english"
        static let pathClassicQuizSubCategories = "classic-quiz-sub-categories"
        static let pathCategories = "categories"
    }
    
    static let shared = FirestoreClient()
    private init() { }
    
    private let db = Firestore.firestore()
    
    func uploadClassicQuizModels(_ models: [ClassicQuizModel]) {
        Task {
            do {
                try await withThrowingTaskGroup(of: Void.self) { [weak self] group in
                    guard let self else { return }
                    for model in models {
                        group.addTask {
                            try await self.writeClassicQuiz(model.toDictionary())
                        }
                    }
                    for try await _ in group { }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func uploadCategoryRoot(_ root: CategoryRootDTO) {
        Task {
            do {
                try await withThrowingTaskGroup(of: Void.self) { [weak self] group in
                    guard let self else { return }
                    
                    root.categories.forEach { category in
                        Task {
                            try await self.writeSubCategory(category: "Cars", subCategory: category.title)
                        }
                    }
                    for try await _ in group { }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func writeClassicQuiz(_ json: [String: Any]) async throws {
        guard let id = json["id"] as? String else { return }
        let doc = db.collection(Constants.pathClassicQuizSubCategories).document(id)
        try await doc.setData(json)
    }
    
    private func writeSubCategory(category: String, subCategory: String) async throws {
        let doc = db.collection(Constants.pathCategories).document(category)
        try await doc.setData(["category": category])
        let categoryInfo: [String: Any] = ["category": category, "subCategory": subCategory]
        try await doc.collection(subCategory).addDocument(data: categoryInfo)
    }
    
    private func signInAnonym() async throws -> Bool{
        let auth = Auth.auth()
        do {
            let _ = try await auth.signInAnonymously()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}

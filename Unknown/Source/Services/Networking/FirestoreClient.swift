//
//  FirestoreClient.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 30.06.2024.
//

import Foundation
import FirebaseAuth

final class FirestoreClient {
    static let shared = FirestoreClient()
    private init() { }
    
    func signInAnonym() async throws {
        let auth = Auth.auth()
        do {
            let user = try await auth.signInAnonymously()
            
        }
    }
}

//
//  AppDelegate.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit
import ChatGPT
import Alamofire

enum Prompts {
    static let quiz = """
    Provide 10 unique questions in single JSON with different difficulty level about pooping for a quiz game with six possible answers of this question formatted as a correctly formatted JSON object questions.
    Question with properties:
            1. id as “replaceWithID”
            2. category name
            2. array with question objects with properties like: question, array of answers, right answer string, id as combined timestamp and order number string
    
    JSON example:

        struct Question: Codable {
            let id: String
            let category: String
            let question: String
            let answers: [String]
            let correctAnswer: String
        }
    """
}

class MyEventMonitor: EventMonitor {
    let queue = DispatchQueue(label: "com.alamofire.eventMonitor")

    func requestDidFinish(_ request: Request) {
        print("Request Finished: \(request)")
    }

    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        print("Response Received: \(response)")
    }
}



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //sendMsg()
        return true
    }
    
    func sendMsg() {
        let message = Message(id: UUID(), role: .user, content: Prompts.quiz, createdAt: Date())
        sendMessage(messages: [message], completion: { })
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}


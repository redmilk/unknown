//
//  AppDelegate.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit
import ChatGPT
import Alamofire

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
        // Override point for customization after application launch.
        
        //Task { await APIClientImpl.shared.tryRequest() }
        
//        requestChatGPT(prompt: "Tell me a joke") { result in
//            switch result {
//            case .success(let response):
//                print(response.object)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
     

        sendMsg()
        
        return true
    }
    
    func sendMsg() {
        let message = Message(id: UUID(), role: .user, content: "Tell me a joke", createdAt: Date())
        sendMessage(messages: [message], completion: {
            print("📣 📢 💬 \("nil")")
        })
    }
    
    func askChatGPT() async throws {
      let chatGPT = ChatGPT(apiKey: "sk-proj-1RAOrYwUi01zW4Q4qucST3BlbkFJxq4wCKNITRtcOIJqGTDz", defaultModel: .gpt3)

      // Basic query
      let firstResponse = try await chatGPT.ask("What is the answer to life, the universe and everything in it?")
      print(firstResponse)

      // Send multiple messages
      let secondResponse = try await chatGPT.ask(
          messages: [
              ChatMessage(role: .system, content: "You are a dog."),
              ChatMessage(role: .user, content: "Do you actually like playing fetch?")
          ],
          model: .gpt3.stableVersion() // Override default model, if needed
      )
      print(secondResponse)
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


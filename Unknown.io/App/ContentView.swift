//
//  ContentView.swift
//  Unknown.io
//
//  Created by Danyl Timofeyev on 13.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoaded: Bool = false
    @State var errorMessage: String?
    
    var body: some View {
        Group {
            if isLoaded {
                HomeViewWrapper()
                    .edgesIgnoringSafeArea(.all)
            } else if let errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                ProgressView("Loading settings...")
            }
        }
        .task {
            do {
                let settings = try await RemoteConfigService.shared.fetchSettings()
                isLoaded = true
                apiKey = settings.key
            } catch let error as RemoteConfigService.RemoteConfigError {
                errorMessage = error.description
            } catch {
                errorMessage = error.localizedDescription
            }
        }
       
        
    }
}

#Preview {
    ContentView()
}

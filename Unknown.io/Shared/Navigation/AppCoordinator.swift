//
//  AppCoordinator.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 03.07.2024.
//
import UIKit.UINavigationController

final class AppCoordinator: Coordinator {
    private let window: UIWindow
    
    private var shouldShowAuth: Bool {
        return false
    }
    
    private var shouldShowOnboarding: Bool {
        return false
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showContent()
    }
    
    func showOnboarding() {
        
    }
    
    func showAuth() {
        
    }
    
    func showContent() {
        
    }
}

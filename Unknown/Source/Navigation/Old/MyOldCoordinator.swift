//
//  Coordinator.swift
//  MyCoordinatorsTemplate
//
//  Created by Danyl Timofeyev on 25.12.2020.
//  Copyright © 2020 Danyl Timofeyev. All rights reserved.
//

import UIKit

protocol CoordinatorProtocolOld: AnyObject {
    
    /// if current coordinator has parent
    var parentCoordinator: CoordinatorProtocolOld? { get set }
    
    /// if navigation starts from UINavigationController
    var navigationController: UINavigationController? { get set }
    
    /// if navigation starts from UITabBarController
    var tabBarController: UITabBarController? { get set }
    
    /// if coordinator can set root scene for application
    var window: UIWindow! { get set }
    
    /// for scene modal presentation and for other conveniences
    var currentController: UIViewController? { get set }
        
    func addChild(_ child: CoordinatorProtocolOld)
    func removeChild(_ child: CoordinatorProtocolOld)
    func clear()
        
    func start()
    func end()

}

class CoordinatorOld: NSObject, CoordinatorProtocolOld {
        
    enum PresentationMode {
        case push(UINavigationController)
        case modal(UIViewController)
        case root(UIWindow)
    }
        
    private var childCoordinators: [String : CoordinatorProtocolOld] = [:]
    private(set) var isAnimatedTransition: Bool = true
    
    weak var window: UIWindow!
    weak var parentCoordinator: CoordinatorProtocolOld?
    weak var currentController: UIViewController?
    weak var navigationController: UINavigationController? {
        didSet {
            updateNavigationDelegates()
        }
    }
    weak var tabBarController: UITabBarController? {
        didSet {
            updateNavigationDelegates()
        }
    }
    
    override init() {
        super.init()
        Logger.initialization(entity: self)
    }
    
    deinit {
        Logger.deinitialization(entity: self)
    }
    
    func start() {
        
    }
    
    func end() {
        currentController?.dismiss(animated: false, completion: nil)
        navigationController?.popToRootViewController(animated: false)
        clear()
    }
    
    func updateNavigationDelegates() {
        navigationController?.delegate = self
        tabBarController?.delegate = self
    }
    
    func addChild(_ child: CoordinatorProtocolOld) {
        let key = String(describing: child)
        childCoordinators[key] = child
    }
    
    func removeChild(_ child: CoordinatorProtocolOld) {
        let key = String(describing: child)
        childCoordinators.removeValue(forKey: key)
        /// Reassign navigation delegates to self when removing child coordinator
        /// otherwise current parent coordinator won't handle default OS navigation events
        updateNavigationDelegates()
     }
    
    func clear() {
        childCoordinators.enumerated().forEach { $0.element.value.clear() }
        childCoordinators.enumerated().forEach { $0.element.value.parentCoordinator?.removeChild(self) }
        childCoordinators.removeAll()
        parentCoordinator?.removeChild(self)
    }
    
    /// Navigation events for UINavigationController
    func didNavigate(_ navigationController: UINavigationController,
                      to viewController: UIViewController,
                      animated: Bool) {
        Logger.log("Navigated to", entity: viewController, symbol: "🛼 [STACK]")
        currentController = viewController
    }
    
    /// Navigation events for UITabBarController
    func didSelect(_ tabBarController: UITabBarController,
                      tab selectedTabController: UIViewController) {
        guard
            let navigationController = selectedTabController as? UINavigationController,
            let topControllerInStack = navigationController.viewControllers.last else {
                Logger.log("Tab selected with no navigation controller embedded", entity: selectedTabController, symbol: "🛼 [PURE TAB]")
                return
        }
        Logger.log("Selected tab with navigation controller", entity: topControllerInStack, symbol: "🛼 [TAB]")
    }
}

// MARK: - UINavigationControllerDelegate
extension CoordinatorOld: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool
    ) {
        didNavigate(navigationController,
                     to: viewController,
                     animated: animated)
    }
    
}

// MARK: - UITabBarControllerDelegate
extension CoordinatorOld: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController
    ) {
        didSelect(tabBarController,
                  tab: viewController)
    }
    
}

//
//  UIApplication+Extension.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 25.06.2024.
//

import UIKit

extension UIApplication {
    var safeAreaInsets: UIEdgeInsets {
        keyWindow?.safeAreaInsets ?? .zero
    }
    
    var hasTopNotch: Bool {
        safeAreaInsets.bottom > 0
    }
    
    var rootViewController: UIViewController? {
        keyWindow?.rootViewController
    }
    
    var size: CGSize? {
        keyWindow?.bounds.size
    }
    
    var statusBarHeight: CGFloat {
        keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    var tabBarHeight: CGFloat {
        (rootViewController as? UITabBarController)?.tabBar.bounds.height ?? 0
    }
    
    var orientation: UIInterfaceOrientation? {
        keyWindow?.windowScene?.interfaceOrientation
    }
    
    func openAppSettings(completion: (() -> Void)? = nil) {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        open(url, options: [:]) { _ in
            completion?()
        }
    }
    
    func openAppSettingsCommand() -> Command {
        Command { [weak self] in
            self?.openAppSettings()
        }.dispatched(on: .main)
    }

    func topViewController(_ base: UIViewController? = UIApplication.shared.rootViewController) -> UIViewController? {
        if let navigationController = base as? UINavigationController {
            return topViewController(navigationController.visibleViewController)
        }
        if let tabController = base as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
    var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .first(where: { [UIScene.ActivationState.foregroundActive, .foregroundInactive].contains($0.activationState) && $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}

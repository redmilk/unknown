//
//  BaseViewController.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 23.02.2024.
//

import UIKit.UIViewController

class BaseViewController: UIViewController {
    private let presenter: Presenter
    
    init(presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    
    @available(*, unavailable, message: "Loading this view controller from a nib is unsupported")
    override convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.init()
    }
    @available(*, unavailable, message: "Loading this view controller from a nib is unsupported")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

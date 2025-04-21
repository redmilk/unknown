//
//  Presenter.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 23.02.2024.
//

import Foundation

protocol Presenter {
    func viewDidLoad()
    
    func viewWillAppear()
    func viewDidAppear()
    
    func viewWillDisappear()
    func viewDidDisappear()
}

extension Presenter {
    func viewDidLoad() {}
    
    func viewWillAppear() {}
    func viewDidAppear() {}
    
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}

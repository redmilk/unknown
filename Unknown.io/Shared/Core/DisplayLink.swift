//
//  DisplayLink.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit

final class DisplayLink {
    
    var onRefresh: () -> Void {
        get { target.updaterFiredHandler }
        set { target.updaterFiredHandler = newValue }
    }
    var isRunning: Bool {
        return !link.isPaused
    }
    var isPaused: Bool {
        return link.isPaused
    }
    
    private let link: CADisplayLink
    private let target = UpdaterTarget()
    
    init() {
        self.link = CADisplayLink(
            target: target,
            selector: #selector(target.updaterFired)
        )
        initialConfigure()
    }
    
    deinit {
        link.invalidate()
    }
    
    private func initialConfigure() {
        pause()
        link.add(to: .main, forMode: .default)
        link.add(to: .main, forMode: .tracking)
    }
    
    func resume() {
        link.isPaused = false
    }
    
    func pause() {
        link.isPaused = true
    }
}

// for retaining by CADisplayLink, to have a possibility call .invalidate()
private class UpdaterTarget {
    var updaterFiredHandler: () -> Void = {}

    @objc
    func updaterFired() {
        updaterFiredHandler()
    }
}

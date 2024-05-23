//
//  AudioSessionManager.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import Combine
import UIKit

final class PlaybackVolumeSession {
    static let shared = PlaybackVolumeSession(isMutedByDefault: true)
    static let swapResult = PlaybackVolumeSession(isMutedByDefault: false)
    static let animate = PlaybackVolumeSession(isMutedByDefault: false)
    
    var isMuted: Bool { isMutedSubject.value }
    var isMutedPublisher: AnyPublisher<Bool, Never> {
        isMutedSubject
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private let isMutedSubject: CurrentValueSubject<Bool, Never>
    
    private init(isMutedByDefault: Bool) {
        self.isMutedSubject = .init(isMutedByDefault)
    }

    func mute() { isMutedSubject.value = true }
    func unmute() { isMutedSubject.value = false }
    func toggleMute() { isMutedSubject.value.toggle() }
}

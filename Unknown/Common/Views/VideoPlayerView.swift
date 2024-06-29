//
//  PlayerViewswift.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import UIKit
import AVKit
import AVFoundation
import Combine

class VideoPlayerLayerView: NiblessView {
    override class var layerClass: AnyClass { AVPlayerLayer.self }
    var playerLayer: AVPlayerLayer { layer as! AVPlayerLayer }
}

final class VideoPlayerView: VideoPlayerLayerView {
    struct PlaybackOptions: OptionSet {
        let rawValue: Int

        static let autostart = PlaybackOptions(rawValue: 1 << 0)
        static let loop = PlaybackOptions(rawValue: 1 << 1)
        static let silent = PlaybackOptions(rawValue: 1 << 2)
        static let resizeAspectFill = PlaybackOptions(rawValue: 1 << 3)
    }
    
    /// Pauses playback automatically when resigning active.
    var playbackPausesWhenResigningActive = false
    
    /// Resumes playback when became active.
    var playbackResumesWhenBecameActive = false

    var itemDuration: CMTime? {
        return player?.currentItem?.asset.duration
    }
    
    private(set) var player: AVPlayer? {
        get {
            return playerLayer.player
        }

        set {
            playerLayer.player = newValue
        }
    }

    private enum State {
        case playing
        case paused
        case stopped
    }
    
    private var state: State = .stopped

    private var loop = false
    private var playedToEndCompletion: (() -> Void)?

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // swiftlint:disable notification_center_detachment
    func setLocalUrl(localUrl: URL, options: PlaybackOptions = [.autostart]) {
        NotificationCenter.default.removeObserver(self)

        if (player?.currentItem?.asset as? AVURLAsset)?.url == localUrl {
            player?.seek(to: .zero)
            player?.play()
            return
        }
        
        let player = AVPlayer(url: localUrl)
        self.player = player

        if options.contains(.silent) {
            player.volume = 0.0
        } else {
            try? AVAudioSession.sharedInstance().setCategory(.playback, options: [.mixWithOthers])
        }
        
        player.actionAtItemEnd = options.contains(.loop) ? .none : .pause

        if options.contains(.resizeAspectFill) {
            playerLayer.videoGravity = .resizeAspectFill
        }

        loop = options.contains(.loop)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(playerDidPlayToEnd),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleApplicationWillResignActive(_:)),
            name: UIApplication.willResignActiveNotification,
            object: UIApplication.shared
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleApplicationDidBecomeActive(_:)),
            name: UIApplication.didBecomeActiveNotification,
            object: UIApplication.shared
        )
        
        if options.contains(.autostart) {
            player.play()
            state = .playing
        }
    }

    func timePublisher() -> AnyPublisher<CMTime, Never>? {
        return player?.periodicTimePublisher(forInterval: 0.1)
    }

    func setPlayedToEnd(completion: @escaping () -> Void) {
        playedToEndCompletion = completion
    }

    func resume() {
        player?.play()
        state = .playing
    }
    
    func playFromStart() {
        player?.seek(to: .zero)
        player?.play()
        state = .playing
    }

    func stop() {
        NotificationCenter.default.removeObserver(self)

        player?.pause()
        player?.replaceCurrentItem(with: nil)
        player = nil
        state = .stopped
    }

    func pause() {
        player?.pause()
        state = .paused
    }
    
    func seekToStart() {
        player?.seek(to: .zero)
    }

    @objc
    private func playerDidPlayToEnd() {
        if loop {
            playFromStart()
        }
        playedToEndCompletion?()
    }
    
    // MARK: - handlers
    
    @objc
    internal func handleApplicationWillResignActive(_ aNotification: Notification) {
        if state == .paused && playbackPausesWhenResigningActive {
            player?.pause()
        }
    }

    @objc
    internal func handleApplicationDidBecomeActive(_ aNotification: Notification) {
        if state == .playing && playbackResumesWhenBecameActive {
            player?.play()
        }
    }
}

//
//  PlyerView.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import AVFoundation
import Combine
import UIKit

class LoopingVideoPlayerView: VideoPlayerLayerView {
    
    let player = AVQueuePlayer()

    private let category: AVAudioSession.Category
    private var asset: AVAsset?
    private var looper: AVPlayerLooper?
    private var cancellable: Set<AnyCancellable> = []
    private var wasPlayingBeforeResignActive = false
    private var isAlwaysMuted: Bool
    
    init(
        _ category: AVAudioSession.Category = .playback,
        restorePlaybackOnBecomeActive: Bool = true,
        isAlwaysMuted: Bool = false
    ) {
        self.category = category
        self.isAlwaysMuted = isAlwaysMuted
        super.init()
        
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.player = player
                
        NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
            .map { _ in }
            .sink { [weak self] in
                guard self?.wasPlayingBeforeResignActive == true
                else {
                    return
                }
                self?.player.play()
            }
            .store(in: &cancellable)
        
        NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
            .map { [weak player] _ in
                player?.isPlaying == true
            }
            .sink { [weak self] in
                self?.wasPlayingBeforeResignActive = $0
            }
            .store(in: &cancellable)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if isAlwaysMuted {
            guard !player.isMuted else { return }
            player.isMuted = true
        }
    }
    
    func put(_ url: URL) {
        put(AVAsset(url: url))
    }
    
    func put(_ url: URL, completion: CommandWith<Double?>) {
        put(AVAsset(url: url))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            completion.perform(with: self.player.currentItem?.duration.seconds)
        })
    }

    func put(_ asset: AVAsset) {
        stop()
        
        self.asset = asset
        try? AVAudioSession.sharedInstance().setCategory(category, options: [.mixWithOthers])
        player.removeAllItems()
        looper = AVPlayerLooper(player: player, templateItem: AVPlayerItem(asset: asset))
    }
    
    func stop() {
        asset?.cancelLoading()
        looper?.disableLooping()
        player.pause()
        player.removeAllItems()
    }
}

//
//  AVPlayer+Extension.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import AVFoundation
import Combine

extension AVPlayer {
    var isPlaying: Bool { rate != 0 && error == nil }

    func periodicTimePublisher(forInterval interval: TimeInterval = 0.5) -> AnyPublisher<CMTime, Never> {
        let cmTime = CMTime(seconds: interval, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        return Publisher(self, forInterval: cmTime)
            .eraseToAnyPublisher()
    }
}

extension AVPlayer {
    private struct Publisher: Combine.Publisher {

        typealias Output = CMTime
        typealias Failure = Never

        var player: AVPlayer
        var interval: CMTime

        init(_ player: AVPlayer, forInterval interval: CMTime) {
            self.player = player
            self.interval = interval
        }

        func receive<S>(subscriber: S) where S: Subscriber, Publisher.Failure == S.Failure, Publisher.Output == S.Input {
            let subscription = CMTime.Subscription(subscriber: subscriber, player: player, forInterval: interval)
            subscriber.receive(subscription: subscription)
        }
    }
}

extension CMTime {
    final class Subscription<SubscriberType: Subscriber>: Combine.Subscription where SubscriberType.Input == CMTime, SubscriberType.Failure == Never {

        var player: AVPlayer?
        var observer: Any?

        init(subscriber: SubscriberType, player: AVPlayer, forInterval interval: CMTime) {
            self.player = player
            observer = player.addPeriodicTimeObserver(forInterval: interval, queue: nil) { time in
                _ = subscriber.receive(time)
            }
        }

        func request(_ demand: Subscribers.Demand) {
            // We do nothing here as we only want to send events when they occur.
            // See, for more info: https://developer.apple.com/documentation/combine/subscribers/demand
        }

        func cancel() {
            if let observer = observer {
                player?.removeTimeObserver(observer)
            }
            observer = nil
            player = nil
        }
    }
}

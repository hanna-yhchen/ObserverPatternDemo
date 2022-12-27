//
//  NowPlayingView.swift
//  
//
//  Created by Hanna Chen on 2022/12/26.
//

import UIKit

class NowPlayingView: UIView {
    lazy var titleLabel = UILabel()
    lazy var durationLabel = UILabel()

    convenience init(notificationCenter: NotificationCenter) {
        self.init(frame: .zero)

        notificationCenter.addObserver(
            self,
            selector: #selector(playbackStateDidChange),
            notificationType: AudioPlayer.State.self)
    }

    @objc private func playbackStateDidChange(_ notification: Notification) {
        guard let state = AudioPlayer.State(notification: notification) else {
            assertionFailure("Invalid notification: \(notification)")
            return
        }

        var item: AudioPlayer.Item?

        switch state {
        case .idle:
            break
        case .playing(let playingItem):
            item = playingItem
        case .paused(let pausedItem):
            item = pausedItem
        }

        if let item = item {
            titleLabel.text = item.title
            durationLabel.text = "\(item.duration)"
        }
    }
}

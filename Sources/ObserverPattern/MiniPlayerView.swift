//
//  MiniPlayerView.swift
//  
//
//  Created by Hanna Chen on 2022/12/26.
//

import UIKit

class MiniPlayerView: UIView {
    lazy var titleLabel = UILabel()
    lazy var durationLabel = UILabel()

    private var observationToken: ObservationToken?

    deinit {
        observationToken?.cancel()
    }

    convenience init(notificationCenter: MyNotificationCenter) {
        self.init(frame: .zero)

        observationToken = notificationCenter.addObserver(forName: .playbackStateDidChange) { [weak self] notification in
            guard
                let self = self,
                let userInfo = notification.userInfo,
                let state = userInfo[AudioPlayer.State.userInfoKey] as? AudioPlayer.State
            else {
                assertionFailure("Invalid notification: \(notification)")
                return
            }

            var item: AudioPlayer.Item?

            switch state {
            case .idle:
                break
            case .paused(let pausedItem):
                item = pausedItem
            case .playing(let playingItem):
                item = playingItem
            }

            if let item = item {
                self.titleLabel.text = item.title
                self.durationLabel.text = "\(item.duration)"
            }
        }
    }
}

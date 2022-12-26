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

    convenience init(notificationCenter: NotificationCenter) {
        self.init(frame: .zero)

        notificationCenter.addObserver(
            self,
            selector: #selector(playbackDidStart),
            name: .playbackDidStart,
            object: nil)
    }

    @objc private func playbackDidStart(_ notification: Notification) {
        guard let item = notification.object as? AudioPlayer.Item else {
            assertionFailure("Invalid object: \(notification.object as Any)")
            return
        }

        titleLabel.text = item.title
        durationLabel.text = "\(item.duration)"
    }
}

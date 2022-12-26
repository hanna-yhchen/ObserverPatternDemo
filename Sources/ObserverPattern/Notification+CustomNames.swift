//
//  Notification+CustomNames.swift
//  
//
//  Created by Hanna Chen on 2022/12/27.
//

import Foundation

extension Notification.Name {
    static var playbackDidStart: Notification.Name { .init(rawValue: "AudioPlayer.playbackDidStart") }

    static var playbackDidPause: Notification.Name { .init(rawValue: "AudioPlayer.playbackDidPause") }

    static var playbackDidStop: Notification.Name { .init(rawValue: "AudioPlayer.playbackDidStop") }
}

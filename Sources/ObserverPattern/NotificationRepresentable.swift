//
//  NotificationRepresentable.swift
//  
//
//  Created by Hanna Chen on 2022/12/27.
//

import Foundation

protocol NotificationRepresentable { }

extension NotificationRepresentable {
    static var notificationName: Notification.Name {
        return Notification.Name(String(reflecting: Self.self))
        // E.g., ObserverPattern.AudioPlayer.State
    }

    static var userInfoKey: String {
        return "UserInfo"
    }

    init?(notification: Notification) {
        guard let value = notification.userInfo?[Self.userInfoKey] as? Self else { return nil }
        self = value
    }
}

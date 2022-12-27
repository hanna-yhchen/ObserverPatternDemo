//
//  NotificationCenter+Generic.swift
//  
//
//  Created by Hanna Chen on 2022/12/27.
//

import Foundation

extension NotificationCenter {
    func post<T>(_ notificationRepresentable: T, object: Any? = nil) where T: NotificationRepresentable {
        post(name: T.notificationName, object: object, userInfo: [T.userInfoKey : notificationRepresentable])
    }

    func addObserver<T>(_ observer: Any, selector: Selector, notificationType notificationRepresentable: T.Type, object: Any? = nil) where T: NotificationRepresentable {
        addObserver(observer, selector: selector, name: T.notificationName, object: object)
    }
}

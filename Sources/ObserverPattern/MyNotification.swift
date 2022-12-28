//
//  MyNotification.swift
//  
//
//  Created by Hanna Chen on 2022/12/28.
//

import Foundation

struct MyNotification {
    var name: MyNotification.Name
    var userInfo: [AnyHashable: Any]?
}

extension MyNotification {
    struct Name: Hashable {
        var aString: String
        init(_ aString: String) {
            self.aString = aString
        }
    }
}

extension MyNotification.Name {
    static var playbackStateDidChange: MyNotification.Name { .init("playbackStateDidChange") }
}

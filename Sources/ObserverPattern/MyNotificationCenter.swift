//
//  MyNotificationCenter.swift
//  
//
//  Created by Hanna Chen on 2022/12/28.
//

import Foundation

class MyNotificationCenter {

    static let `default` = MyNotificationCenter()

    typealias ObservationHandler = (MyNotification) -> Void

    var observations: [MyNotification.Name: [UUID: ObservationHandler]] = [:]

    func post(_ notification: MyNotification) {
        guard let namedObservations = observations[notification.name] else { return }

        for handler in namedObservations.values {
            handler(notification)
        }
    }

    func post(
        name: MyNotification.Name,
        userInfo: [AnyHashable: Any]?
    ) {
        post(MyNotification(name: name, userInfo: userInfo))
    }

    func addObserver(
        forName name: MyNotification.Name,
        handler: @escaping ObservationHandler
    ) -> ObservationToken {
        let id = UUID()
        var namedObservations = observations[name] ?? [:]
        namedObservations.updateValue(handler, forKey: id)
        observations.updateValue(namedObservations, forKey: name)

        return ObservationToken { [weak self] in
            guard var namedObservations = self?.observations[name] else { return }
            namedObservations.removeValue(forKey: id)
            self?.observations.updateValue(namedObservations, forKey: name)
        }
    }
}

class ObservationToken {
    private let cancellationHandler: () -> Void

    init(cancellationHandler: @escaping () -> Void) {
        self.cancellationHandler = cancellationHandler
    }

    func cancel() {
        cancellationHandler()
    }
}

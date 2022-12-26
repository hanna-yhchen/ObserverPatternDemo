//
//  AudioPlayer.swift
//
//
//  Created by Hanna Chen on 2022/12/26.
//

import Foundation

class AudioPlayer {
    private var state = State.idle {
        didSet {
            stateDidChange()
        }
    }

    func stateDidChange() {
        // TODO: Send notifications to all observers
    }
}

extension AudioPlayer {
    func play(_ item: Item) {
        state = .playing(item)
        startPlayback(with: item)
    }

    func pause() {
        switch state {
        case .idle, .paused:
            assertionFailure("AudioPlayer should not get paused when it is not playing any item.")
        case .playing(let item):
            state = .paused(item)
        }
    }

    func stop() {
        state = .idle
    }

    private func startPlayback(with item: Item) {}
    private func pausePlayback() {}
    private func stopPlayback() {}
}

extension AudioPlayer {
    struct Item {
        let title: String
        var duration: TimeInterval
    }

    enum State {
        case idle
        case playing(Item)
        case paused(Item)
    }
}

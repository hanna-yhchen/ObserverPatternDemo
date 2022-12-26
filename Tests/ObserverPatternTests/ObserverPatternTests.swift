import XCTest
@testable import ObserverPattern

final class ObserverPatternTests: XCTestCase {

    var audioPlayer: AudioPlayer!
    var miniPlayerView: MiniPlayerView!
    var nowPlayingView: NowPlayingView!

    override func setUp() {
        super.setUp()
        let notificationCenter = NotificationCenter()
        audioPlayer = AudioPlayer(notificationCenter: notificationCenter)
        miniPlayerView = MiniPlayerView(notificationCenter: notificationCenter)
        nowPlayingView = NowPlayingView(notificationCenter: notificationCenter)
    }

    override func tearDown() {
        super.tearDown()
        audioPlayer = nil
        miniPlayerView = nil
        nowPlayingView = nil
    }

    func testNowPlayingViewUpdateLabelsWhenAudioPlayerStartPlayback() {
        let title = "ABC Song"
        let duration = 0.0
        audioPlayer.play(AudioPlayer.Item(title: title, duration: duration))

        XCTAssertEqual(nowPlayingView.titleLabel.text, title)
        XCTAssertEqual(nowPlayingView.durationLabel.text, String(duration))
    }

    func testMiniPlayerViewUpdateLabelsWhenAudioPlayerStartPlayback() {
        let title = "ABC Song"
        let duration = 0.0
        audioPlayer.play(AudioPlayer.Item(title: title, duration: duration))

        XCTAssertEqual(miniPlayerView.titleLabel.text, title)
        XCTAssertEqual(miniPlayerView.durationLabel.text, String(duration))
    }
}

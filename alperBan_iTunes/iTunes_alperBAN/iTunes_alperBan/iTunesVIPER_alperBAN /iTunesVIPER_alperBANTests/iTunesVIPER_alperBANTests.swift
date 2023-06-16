//
//  iTunesVIPER_alperBANTests.swift
//  iTunesVIPER_alperBANTests
//
//  Created by Alper Ban on 7.06.2023.
//

//  iTunesVIPER_alperBANTests.swift
//  iTunesVIPER_alperBANTests
//
//  Created by Alper Ban on 7.06.2023.
//

import XCTest
@testable import iTunesVIPER_alperBAN

final class iTunesVIPER_alperBANTests: XCTestCase {

    var viewController: SongDetailViewController!
    
    override func setUpWithError() throws {
        viewController = SongDetailViewController()
        viewController.loadViewIfNeeded()
        
        let song = Song(
            trackName: "Song 1",
            artistName: "Artist 1",
            collectionName: "Collection 1",
            primaryGenreName: "Genre 1",
            trackPrice: 0.99,
            collectionPrice: 9.99,
            previewUrl: "https://example.com/song1.mp3",
            artworkUrl100: "https://example.com/song1.jpg"
        )
        viewController.song = song
    }

    override func tearDownWithError() throws {
        viewController = nil
    }

    func testBookmarkButtonTapped() {
        // Initial state: isBookmarked = false
        XCTAssertFalse(viewController.isBookmarked, "Initial state should be not bookmarked")
        
        viewController.bookmarkButtonTapped()
        
        // After tapping bookmark button: isBookmarked = true
        XCTAssertTrue(viewController.isBookmarked, "After tapping bookmark button, isBookmarked should be true")
        
        viewController.bookmarkButtonTapped()
        
        // After tapping bookmark button again: isBookmarked = false
        XCTAssertFalse(viewController.isBookmarked, "After tapping bookmark button again, isBookmarked should be false")
    }

    func testPlayButtonTapped() {
        // Initial state: isPlaying = false
        XCTAssertFalse(viewController.isPlaying, "Initial state should be not playing")
        
        viewController.playButtonTapped()
        
        // After tapping play button: isPlaying = true
        XCTAssertTrue(viewController.isPlaying, "After tapping play button, isPlaying should be true")
        
        viewController.playButtonTapped()
        
        // After tapping play button again: isPlaying = false
        XCTAssertFalse(viewController.isPlaying, "After tapping play button again, isPlaying should be false")
    }

    func testUIConfiguration() {
        XCTAssertEqual(viewController.navigationItem.rightBarButtonItem?.image, UIImage(systemName: "bookmark"), "Right bar button item should have bookmark image")
        XCTAssertEqual(viewController.playButton.currentImage, UIImage(systemName: "play.circle"), "Play button should have play icon image")
        
        XCTAssertEqual(viewController.title, "Song 1", "View controller title should match song title")
        
        XCTAssertEqual(viewController.titleLabel.text, "Song 1", "Title label should display song title")
        XCTAssertEqual(viewController.artistLabel.text, "Artist 1", "Artist label should display artist name")
        XCTAssertEqual(viewController.albumLabel.text, "Collection: Collection 1", "Album label should display collection name")
        XCTAssertEqual(viewController.genreLabel.text, "Genre: Genre 1", "Genre label should display genre name")
        XCTAssertEqual(viewController.trackPriceLabel.text, "Track Price: 0.99", "Track price label should display track price")
        XCTAssertEqual(viewController.collectionPriceLabel.text, "Collection Price: 9.99", "Collection price label should display collection price")
    }
}

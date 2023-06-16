//  iTunesVIPER_alperBANUITests.swift
//  iTunesVIPER_alperBANUITests
//
//  Created by Alper Ban on 7.06.2023.
//

import XCTest
@testable import iTunesVIPER_alperBAN

class DetailViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
        
        try super.tearDownWithError()
    }
    
    func testTrackPriceLabel() {
        let viewController = SongDetailViewController()
        viewController.song = Song(artworkUrl100: "https://example.com/image.jpg", artistName: "Test Artist", trackName: "Test Track", trackPrice: 0.99, collectionName: "Test Collection", previewUrl: "https://example.com/song.mp3", collectionPrice: 9.99, primaryGenreName: "Test Genre")
        
        viewController.loadViewIfNeeded()
        
        let trackPriceLabel = viewController.view.subviews.compactMap { $0 as? UILabel }.first { $0.text == "Track Price: 0.99" }
        
        XCTAssertNotNil(trackPriceLabel)
    }
    
    func testCollectionPriceLabel() throws {
        app.tables.cells.staticTexts["Test Song"].tap()
        
        let collectionPriceLabel = app.staticTexts["Collection Price: 9.99"]
        
        XCTAssertTrue(collectionPriceLabel.exists)
    }
    
    func testPlayButtonState() throws {
        app.tables.cells.staticTexts["Test Song"].tap()
        
        let playButton = app.buttons["playButton"]
        let playButtonImage = playButton.images["play.circle"]
        
        XCTAssertTrue(playButton.exists)
        XCTAssertTrue(playButtonImage.exists)
    }
    
    func testPlayButtonTapped() throws {
        app.tables.cells.staticTexts["Test Song"].tap()
        
        let playButton = app.buttons["playButton"]
        
        XCTAssertTrue(playButton.exists)
        
        playButton.tap()
        
        let pauseButtonImage = playButton.images["pause.circle"]
        
        XCTAssertTrue(pauseButtonImage.exists)
    }
    
    func testBookmarkButtonTapped_AddBookmark() throws {
        app.tables.cells.staticTexts["Test Song"].tap()
        
        let bookmarkButton = app.buttons["bookmarkButton"]
        
        XCTAssertTrue(bookmarkButton.exists)
        
        bookmarkButton.tap()
        
        let bookmarkFilledImage = bookmarkButton.images["bookmark.fill"]
        
        XCTAssertTrue(bookmarkFilledImage.exists)
    }
    
    func testBookmarkButtonTapped_RemoveBookmark() throws {
        app.tables.cells.staticTexts["Test Song"].tap()
        
        let bookmarkButton = app.buttons["bookmarkButton"]
        
        XCTAssertTrue(bookmarkButton.exists)
        
        bookmarkButton.tap()
        bookmarkButton.tap()
        
        let bookmarkImage = bookmarkButton.images["bookmark"]
        
        XCTAssertTrue(bookmarkImage.exists)
    }
    
    func testBookmarkButtonTapped_AddAndRemoveBookmark() throws {
        app.tables.cells.staticTexts["Test Song"].tap()
        
        let bookmarkButton = app.buttons["bookmarkButton"]
        
        XCTAssertTrue(bookmarkButton.exists)
        
        bookmarkButton.tap()
        
        let bookmarkFilledImage = bookmarkButton.images["bookmark.fill"]
        
        XCTAssertTrue(bookmarkFilledImage.exists)
        
        bookmarkButton.tap()
        
        let bookmarkImage = bookmarkButton.images["bookmark"]
        
        XCTAssertTrue(bookmarkImage.exists)
    }
    
    func testPlayButtonTapped_PlayingState() throws {
        app.tables.cells.staticTexts["Test Song"].tap()
        
        let playButton = app.buttons["playButton"]
        
        XCTAssertTrue(playButton.exists)
        
        playButton.tap()
        
        let pauseButtonImage = playButton.images["pause.circle"]
        
        XCTAssertTrue(pauseButtonImage.exists)
        
        playButton.tap()
        
        let playButtonImage = playButton.images["play.circle"]
        
        XCTAssertTrue(playButtonImage.exists)
    }
}

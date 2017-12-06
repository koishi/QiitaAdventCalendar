//
//  EntryFetcherTests.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import XCTest
@testable import QiitaAdventCalendar

class EntryFetcherTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testScrapingCalendarItems() {
        let expectation = self.expectation(description: "testScrapingCalendarItems request ios-2")
        
        let calendar = CalendarEntity()
        calendar.url = "advent-calendar/2015/ios-2"
        
        EntryFetcher.scrapingCalendarItems(calendar, completion: {
            expectation.fulfill()
        })
        waitForExpectations(timeout: 30.0, handler:nil)
        XCTAssertEqual(calendar.items.count, 25)
    }
    
    func testScrapingCalendarItem() {
        let expectation = self.expectation(description: "testScrapingCalendarItem")
        
        let calendar = CalendarEntity()
        calendar.url = "advent-calendar/2015/swift3"
        
        EntryFetcher.scrapingCalendarItems(calendar, completion: {
            expectation.fulfill()
        })
        waitForExpectations(timeout: 30.0, handler:nil)
        let item = calendar.items[24]
        XCTAssertEqual(item.date, "25")
        XCTAssertEqual(item.authorName, " koishi")
        XCTAssertEqual(item.authorURL, "/koishi")
        XCTAssertEqual(item.authorIconURL, "https://qiita-image-store.s3.amazonaws.com/0/11090/profile-images/1498919078")
        XCTAssertEqual(item.entryTitle, "Swift 3.0 エラー処理入門")
        XCTAssertEqual(item.entryURL, "http://qiita.com/koishi/items/67cf4d0f51c4d79f1d22")
    }

}

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
  
}

//
//  EntryManagerTests.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import XCTest
@testable import QiitaAdventCalendar

class EntryManagerTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testScrapingCalendarItems() {
    let expectation = expectationWithDescription("testScrapingCalendarItems request ios-2")
    
    let calendar = CalendarEntity()
    calendar.url = "advent-calendar/2015/ios-2"
    
    EntryManager.scrapingCalendarItems(calendar, completion: {
      expectation.fulfill()
    })
    waitForExpectationsWithTimeout(30.0, handler:nil)
    XCTAssertEqual(calendar.items.count, 25)
  }
  
}

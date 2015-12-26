//
//  AdventCalendarManagerTests.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/26.
//  Copyright © 2015年 bs. All rights reserved.
//

import XCTest
@testable import QiitaAdventCalendar

class AdventCalendarManagerTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testScrapingCalendars_to_be_decided() {
    let expectation = expectationWithDescription("scrapingCalendars request to_be_decided")

    let category = CategoryEntity()
    category.url = "advent-calendar/2015/categories/to_be_decided"
    AdventCalendarManager.sharedInstance.scrapingCalendars(category, completion: {
      expectation.fulfill()
    })
    waitForExpectationsWithTimeout(30.0, handler:nil)
    print(category.calendars)
    XCTAssertEqual(category.calendars.count, 24)
  }

  func testScrapingCalendars_company() {
    let expectation = expectationWithDescription("scrapingCalendars request company")
    
    let category = CategoryEntity()
    category.url = "advent-calendar/2015/categories/company"
    AdventCalendarManager.sharedInstance.scrapingCalendars(category, completion: {
      expectation.fulfill()
    })
    waitForExpectationsWithTimeout(30.0, handler:nil)
    print(category.calendars)
    XCTAssertEqual(category.calendars.count, 78)
  }

}

//
//  CalendarFetcherTests.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/26.
//  Copyright © 2015年 bs. All rights reserved.
//

import XCTest
@testable import QiitaAdventCalendar

class CalendarFetcherTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testScrapingCalendars_to_be_decided() {
    let expectation = self.expectation(description: "scrapingCalendars request to_be_decided")

    let category = CategoryEntity()
    category.url = "advent-calendar/2015/categories/to_be_decided"
    CalendarFetcher.scrapingCalendars(category, completion: {
      expectation.fulfill()
    })
    waitForExpectations(timeout: 30.0, handler:nil)
    print(category.calendars)
    XCTAssertEqual(category.calendars.count, 23)
  }

  func testScrapingCalendars_company() {
    let expectation = self.expectation(description: "scrapingCalendars request company")
    
    let category = CategoryEntity()
    category.url = "advent-calendar/2015/categories/company"
    CalendarFetcher.scrapingCalendars(category, completion: {
      expectation.fulfill()
    })
    waitForExpectations(timeout: 30.0, handler:nil)
    print(category.calendars)
    XCTAssertEqual(category.calendars.count, 78)
  }

  func testScrapingCalendars_2014() {
    let expectation = self.expectation(description: "scrapingCalendars request 2014")
    
    let category = CategoryEntity()
    category.url = "advent-calendar/2014"
    category.year = .earlyYear
    CalendarFetcher.scrapingCalendars(category, completion: {
      expectation.fulfill()
    })
    waitForExpectations(timeout: 30.0, handler:nil)
    print(category.calendars)
    XCTAssertEqual(category.calendars.count, 214)
  }

  func testScrapingCalendars_2013() {
    let expectation = self.expectation(description: "scrapingCalendars request 2013")
    
    let category = CategoryEntity()
    category.url = "advent-calendar/2013"
    category.year = .earlyYear
    CalendarFetcher.scrapingCalendars(category, completion: {
      expectation.fulfill()
    })
    waitForExpectations(timeout: 30.0, handler:nil)
    print(category.calendars)
    XCTAssertEqual(category.calendars.count, 82)
  }
  
  func testScrapingCalendars_2012() {
    let expectation = self.expectation(description: "scrapingCalendars request 2012")
    
    let category = CategoryEntity()
    category.url = "advent-calendar/2012"
    category.year = .earlyYear
    CalendarFetcher.scrapingCalendars(category, completion: {
      expectation.fulfill()
    })
    waitForExpectations(timeout: 30.0, handler:nil)
    print(category.calendars)
    XCTAssertEqual(category.calendars.count, 29)
  }

  func testScrapingCalendars_2011() {
    let expectation = self.expectation(description: "scrapingCalendars request 2011")
    
    let category = CategoryEntity()
    category.url = "advent-calendar/2011"
    category.year = .earlyYear
    CalendarFetcher.scrapingCalendars(category, completion: {
      expectation.fulfill()
    })
    waitForExpectations(timeout: 30.0, handler:nil)
    print(category.calendars)
    XCTAssertEqual(category.calendars.count, 1)
  }

}

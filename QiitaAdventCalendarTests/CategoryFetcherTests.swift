//
//  CategoryFetcherTests.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/26.
//  Copyright © 2015年 bs. All rights reserved.
//

import XCTest
@testable import QiitaAdventCalendar

class CategoryFetcherTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testScrapingCategories() {
    let expectation = self.expectation(description: "scrapingCategories request")
    
    var categories = [CategoryEntity]()
    CategoryFetcher.scrapingCategories("2016") { category in
        categories = category
        print(categories)
        expectation.fulfill()
    }

    waitForExpectations(timeout: 30.0, handler:nil)
    XCTAssertEqual(categories.count, 14)
  }

}

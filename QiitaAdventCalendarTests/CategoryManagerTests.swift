//
//  CategoryManagerTests.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/26.
//  Copyright © 2015年 bs. All rights reserved.
//

import XCTest
@testable import QiitaAdventCalendar

class CategoryManagerTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testScrapingCategories() {
    let expectation = self.expectation(description: "scrapingCategories request")
    
    CategoryManager.sharedInstance.scrapingCategories({
      print(CategoryManager.sharedInstance.categories)
      expectation.fulfill()
    })
    waitForExpectations(timeout: 30.0, handler:nil)
    XCTAssertEqual(CategoryManager.sharedInstance.categories.count, 14)
  }

}

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
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testScrapingCategories() {
    let expectation = expectationWithDescription("asynchronous request")

    CategoryManager.sharedInstance.scrapingCategories({
      print(CategoryManager.sharedInstance.Categories)
      expectation.fulfill()
    })
    XCTAssertEqual(CategoryManager.sharedInstance.Categories.count, 14)
    waitForExpectationsWithTimeout(10.0, handler:nil)
  }

}

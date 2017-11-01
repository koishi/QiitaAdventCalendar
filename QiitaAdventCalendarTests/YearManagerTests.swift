//
//  YearManagerTests.swift
//  QiitaAdventCalendar
//
//  Created by 大石弘一郎 on 2017/07/02.
//  Copyright © 2017年 bs. All rights reserved.
//

import XCTest
@testable import QiitaAdventCalendar

class YearManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testScrapingYearItems() {
        let expectation = self.expectation(description: "testScrapingYearItems")

        var years = [YearEntity]()

        YearFetcher.scrapingYearItems { responce in
            print(years)
            years = responce
            expectation.fulfill()
        }

        waitForExpectations(timeout: 30.0, handler:nil)
        XCTAssertEqual(years.count, 7)
    }

}

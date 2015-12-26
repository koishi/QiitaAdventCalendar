//
//  CategoryManager.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/26.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation
import Ji

class CategoryManager: NSObject {

  var categories = [CategoryEntity]()

  static let sharedInstance = CategoryManager()

  func scrapingCategories(completion:() -> Void) {
    
    if categories.count > 0 {
      completion()
      return
    }

    let jiDoc = Ji(htmlURL: NSURL(string: "http://qiita.com/advent-calendar/2015/categories")!)
    if let bodyNode = jiDoc?.xPath("//body")!.first {
      let contentDivNode = bodyNode.xPath("div[@id='main']/div[@class='container adventCalendarBody']/div[@class='row']/div[@class='col-lg-3 col-md-4 col-sm-6']/div[@class='adventCalendarCard']")
      for childNode in contentDivNode {

        let category = CategoryEntity()
        if let title = childNode.firstChildWithName("a")?.content {
          category.title = title
        }
        if let url = childNode.firstChildWithName("a")?.attributes["href"] {
          category.url = url
        }
        categories.append(category)
      }
    }
    completion()
  }
}

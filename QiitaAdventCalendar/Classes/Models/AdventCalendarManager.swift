//
//  AdventCalendarManager.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/26.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation
import Ji

class AdventCalendarManager: NSObject {

  static let sharedInstance = AdventCalendarManager()

  func scrapingCalendars(category: CategoryEntity, completion:() -> Void) {

    let jiDoc = Ji(htmlURL: NSURL(string: "http://qiita.com/" + category.url)!)
    if let bodyNode = jiDoc?.xPath("//body")!.first {

      let contentDivNode = bodyNode.xPath("div[@id='main']/div[@class='container']/div[@class='adventCalendarList']/table[@class='table adventCalendarList']/tbody/tr")
      for childNode in contentDivNode {
        let calendar = AdventCalendarEntity()
        let spanNode = childNode.firstChildWithName("td")?.childrenWithName("a")
        if let title = spanNode?.first?.content {
          calendar.title = title
        }
        if let url = spanNode?.first?.attributes["href"] {
          calendar.url = url
        }
        category.calendars.append(calendar)
      }

      completion()
    }
  }
  
}

//
//  CalendarManager.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/26.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation
import Ji

class CalendarManager: NSObject {

  static func scrapingCalendars(_ category: CategoryEntity, completion:() -> Void) {

    if category.calendars.count > 0 {
      completion()
      return
    }

    let jiDoc = Ji(htmlURL: URL(string: "http://qiita.com/" + category.url)!)
    if let bodyNode = jiDoc?.xPath("//body")!.first {

      let contentDivNode = bodyNode.xPath(category.year.xPath())
      for childNode in contentDivNode {
        let calendar = CalendarEntity()
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

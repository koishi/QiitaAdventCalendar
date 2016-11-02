//
//  CategoryEntity.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/26.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation

class CategoryEntity: NSObject {
  var title = ""
  var url = ""
  var calendars = [CalendarEntity]()
  var year: Year = .LateYear

  enum Year {
    // 2015年以降
    case LateYear
    // 2014年以前
    case EarlyYear
    
    func xPath() -> String {
      switch self {
      case .LateYear:
        return "div[@id='main']/div[@class='container']/div[@class='adventCalendarList']/table[@class='table adventCalendarList']/tbody/tr"
      case .EarlyYear:
        return "div[@id='main']/div[@class='container adventCalendarBody']/div[@class='row']/table[@class='table adventCalendarList']/tbody/tr"
      }
    }
  }

  convenience init(title: String, url: String, year: Year) {
    self.init()
    self.title = title
    self.url = url
    self.year = year
  }

}

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
  var calendars = [AdventCalendarEntity]()
  var year: Year = .LateYear

  enum Year: Int {
    case LateYear
    case EarlyYear
  }

  func xPath() -> String {
    switch year {
    case .LateYear:
      return "div[@id='main']/div[@class='container']/div[@class='adventCalendarList']/table[@class='table adventCalendarList']/tbody/tr"
    case .EarlyYear:
      return "div[@id='main']/div[@class='container adventCalendarBody']/div[@class='row']/table[@class='table adventCalendarList']/tbody/tr"
    }
  }

}

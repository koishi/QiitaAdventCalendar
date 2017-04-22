//
//  EntryManager.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation
import Ji

class EntryManager: NSObject {
  
  static func scrapingCalendarItems(_ calendar: CalendarEntity, completion:() -> Void) {
    
    if calendar.items.count > 0 {
      completion()
      return
    }
    
    let jiDoc = Ji(htmlURL: URL(string: "http://qiita.com/" + calendar.url)!)
    if let bodyNode = jiDoc?.xPath("//body")!.first {
      
      let contentDivNode = bodyNode.xPath("div[@id='main']/div[@class='adventCalendarSection']/div[@class='container']/div[@class='col-xm-12']/div[@class='adventCalendarItem']")
      
      for childNode in contentDivNode {
        
        let item = EntryEntity()
        
        let spanNode = childNode.childrenWithName("div")
        for node in spanNode {
          switch node.attributes["class"]! {
          case "adventCalendarItem_date":
            if let content = node.content {
              item.date = content
            }
          case "adventCalendarItem_author":
            if let name = node.firstChildWithName("a")?.content {
              item.authorName = name
            }
            if let src = node.firstChildWithName("a")?.firstChildWithName("img")?.attributes["src"] {
              item.authorIconURL = src
            }
            if let href = node.firstChildWithName("a")?.attributes["href"] {
              item.authorURL = href
            }
          case "adventCalendarItem_entry":
            if let title = node.firstChildWithName("a")?.content {
              item.entryTitle = title
            }
            if let url = node.firstChildWithName("a")?.attributes["href"] {
              item.entryURL = url
            }
          case "adventCalendarItem_comment":
            if let content = node.content {
              item.comment = content
            }
          default:
            break
          }
        }
        calendar.items.append(item)
      }
      completion()
    }
  }
}

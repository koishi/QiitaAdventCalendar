//
//  EntryFetcher.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation
import Ji

class EntryFetcher {
    
    static func scrapingCalendarItems(_ calendar: CalendarEntity, completion:@escaping () -> Void) {
        
        if calendar.items.count > 0 {
            completion()
            return
        }

        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        DispatchQueue.global().async {
            let jiDoc = Ji(htmlURL: URL(string: "https://qiita.com/" + calendar.url)!)
            if let bodyNode = jiDoc?.xPath("//body")!.first {
                
                let contentDivNode = bodyNode.xPath("div[@id='main']/div[@class='container adventCalendarCalendar hidden-xs']/div[@class='row']/div[@class='col-sm-12']/table[@class='table']/tbody/tr/td")
                
                for childNode in contentDivNode.filter({$0.attributes["class"] == "adventCalendarCalendar_day"}) {

                    let item = EntryEntity()
                    for child in childNode.children {
                        switch child.attributes["class"]! {
                        case "adventCalendarCalendar_date":
                            if let content = child.content {
                                item.date = content
                            }
                        case "adventCalendarCalendar_author":
                            if let name = child.content {
                                item.authorName = name
                            }
                            if let src = child.firstChildWithName("a")?.firstChildWithName("img")?.attributes["src"] {
                                item.authorIconURL = src
                            }
                            if let href = child.firstChildWithName("a")?.attributes["href"] {
                                item.authorURL = href
                            }
                        case "adventCalendarCalendar_comment":
                            if let title = child.firstChildWithName("a")?.content {
                                item.entryTitle = title
                            }
                            if let url = child.firstChildWithName("a")?.attributes["href"] {
                                item.entryURL = url
                            }
                        default:
                            break
                        }
                    }
                    calendar.items.append(item)
                }
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
                completion()
            }
        }
    }
}

//
//  CalendarFetcher.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/26.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation
import Ji

class CalendarFetcher {
    
    static func scrapingCalendars(_ category: CategoryEntity, completion:@escaping () -> Void) {
        
        if category.calendars.count > 0 {
            completion()
            return
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        DispatchQueue.global().async {
            let jiDoc = Ji(htmlURL: URL(string: "https://qiita.com/" + category.url)!)
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
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                completion()
            }
        }
    }
    
}

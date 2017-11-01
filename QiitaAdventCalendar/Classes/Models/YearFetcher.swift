//
//  YearFetcher.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation
import UIKit
import Ji

struct YearFetcher {

    static let mainStoryboard = "Main"

    static func viewController(_ yearEntity: YearEntity) -> UIViewController? {
        
        guard let year = Int(yearEntity.year) else {
            return nil
        }
        
        switch year {
        case 2011...2014:
            let category = CategoryEntity(title: yearEntity.year, url: "advent-calendar/" + yearEntity.year, year: .earlyYear)
            let storyboard = UIStoryboard(name: YearFetcher.mainStoryboard, bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: String(describing: CalendarViewController.self)) as! CalendarViewController
            vc.category = category
            return vc
        default:
            let storyboard = UIStoryboard(name: YearFetcher.mainStoryboard, bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: String(describing: CategoryViewController.self)) as! CategoryViewController
            vc.year = yearEntity
            return vc
        }
    }

    static func scrapingYearItems(completion:@escaping (_ years: [YearEntity]) -> Void) {
        
        var years = [YearEntity]()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        DispatchQueue.global().async {
            let jiDoc = Ji(htmlURL: URL(string: "https://qiita.com/advent-calendar")!)
            guard let bodyNode = jiDoc?.xPath("//body")!.first else {
                return
            }
            
            let contentDivNode = bodyNode.xPath("div[@id='main']/div[@class='adventCalendarSection']/div[@class='adventCalendarYearList']/div[@class='container']/div[@class='row adventCalendarYearList_element']")
            
            for childNode in contentDivNode {
                
                var item = YearEntity()
                guard let spanNode = childNode.xPath("a[@class='adventCalendarYearList_clickable']").first?.childrenWithName("div") else {
                    continue
                }
                
                for node in spanNode {
                    switch node.attributes["class"]! {
                    case "adventCalendarYearList_heading col-sm-8":
                        if let content = node.content {
                            item.year = content
                        }
                    case "col-sm-2":
                        if let content = node.xPath("dl/dt").first?.content, let value = node.xPath("dl/dd").first?.content {
                            item.countItems.append((content, value))
                        }
                    default:
                        break
                    }
                }
                years.append(item)
            }
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            completion(years)
        }
    }
}

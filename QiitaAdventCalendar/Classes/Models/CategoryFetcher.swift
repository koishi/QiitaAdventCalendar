//
//  CategoryFetcher.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/26.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation
import Ji

class CategoryFetcher {

  static func scrapingCategories(_ year: YearEntity, completion: @escaping (_ categories: [CategoryEntity]) -> Void) {

    UIApplication.shared.isNetworkActivityIndicatorVisible = true

    DispatchQueue.global().async {
        var categories = [CategoryEntity]()
        let jiDoc = Ji(htmlURL: URL(string: "https://qiita.com/advent-calendar/\(year.year)/categories")!)
        if let bodyNode = jiDoc?.xPath("//body")!.first {
//            let contentDivNode = bodyNode.xPath("div[@class='allWrapper']/div[@class='p-adcal']/div[@class='p-adcal_container']/div[@class='p-adcal_main']/div[@class='ac-CategoryCardWrapper']/div")
            let contentDivNode = bodyNode.xPath("div[@class='allWrapper']/div[@class='p-adcal']")
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
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        completion(categories)
    }

  }
}

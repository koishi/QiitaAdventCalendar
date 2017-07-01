//
//  YearManager.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation
import UIKit

class YearManager: NSObject {
    
    static let years = ["2016", "2015", "2014", "2013", "2012", "2011"]
    
    static let mainStoryboard = "Main"
    
    static func rootViewController(_ year: String) -> UIViewController {
        switch Int(year)! {
        case 2011...2014:
            let category = CategoryEntity(title: year, url: "advent-calendar/" + year, year: .earlyYear)
            let storyboard = UIStoryboard(name: mainStoryboard, bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: String(describing: CalendarViewController.self)) as! CalendarViewController
            vc.category = category
            return vc
        default:
            let storyboard = UIStoryboard(name: mainStoryboard, bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: String(describing: CategoryViewController.self)) as! CategoryViewController
            vc.year = year
            return vc
        }
    }
    
}

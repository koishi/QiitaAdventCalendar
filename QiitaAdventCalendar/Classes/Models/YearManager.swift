//
//  YearManager.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import Foundation
import UIKit

struct YearManager {
    
    enum year: Int {
        case _2011 = 2011
        case _2012 = 2012
        case _2013 = 2013
        case _2014 = 2014
        case _2015 = 2015
        case _2016 = 2016

        func string() -> String {
            return String(self.rawValue)
        }
        
        func rootViewController() -> UIViewController {
            switch self.rawValue {
            case 2011...2014:
                let category = CategoryEntity(title: self.string(), url: "advent-calendar/" + self.string(), year: .earlyYear)
                let storyboard = UIStoryboard(name: mainStoryboard, bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: String(describing: CalendarViewController.self)) as! CalendarViewController
                vc.category = category
                return vc
            default:
                let storyboard = UIStoryboard(name: mainStoryboard, bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: String(describing: CategoryViewController.self)) as! CategoryViewController
                vc.year = self
                return vc
            }
        }
    }

    static let years: [year] = [._2016, ._2015, ._2014, ._2013, ._2012, ._2011]
    static let mainStoryboard = "Main"
    
}

//
//  CalendarViewController.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!

  private let cellIdentifier = "Cell"

  var category: CategoryEntity!

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    
    navigationItem.title = category.title
    
    // カテゴリ内のアドベントカレンダーの読込
    CalendarManager.scrapingCalendars(category, completion: {
      self.tableView.reloadData()
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // MARK: - UITableViewDataSource
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
    let calender = category.calendars[indexPath.row]
    cell.textLabel?.text = calender.title
    return cell
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let count = category?.calendars.count else {
      return 0
    }
    return count
  }
  
  // MARK: - UITableDelegate

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("EntryListViewController") as! EntryListViewController
    vc.calendar = category.calendars[indexPath.row]
    self.navigationController?.pushViewController(vc, animated: true)
  }
}

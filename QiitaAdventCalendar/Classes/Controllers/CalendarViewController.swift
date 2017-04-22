//
//  CalendarViewController.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!

  fileprivate let cellIdentifier = "Cell"

  var category: CategoryEntity!

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    
    navigationItem.title = category.title
    
    // カテゴリ内のアドベントカレンダーの読込
    CalendarManager.scrapingCalendars(category, completion: {
      self.tableView.reloadData()
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

extension CalendarViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
    let calender = category.calendars[indexPath.row]
    cell.textLabel?.text = calender.title
    return cell
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let count = category?.calendars.count else {
      return 0
    }
    return count
  }
  
}

extension CalendarViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: EntryListViewController.self)) as! EntryListViewController
    vc.calendar = category.calendars[indexPath.row]
    self.navigationController?.pushViewController(vc, animated: true)
  }

}

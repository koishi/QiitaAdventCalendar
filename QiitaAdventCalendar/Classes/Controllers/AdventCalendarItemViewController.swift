//
//  AdventCalendarItemViewController.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class AdventCalendarItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  private let cellIdentifier = "Cell"
  
  var calendar: AdventCalendarEntity!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
  
    navigationItem.title = calendar.title
    
    AdventCalendarItemEntityManager.scrapingCalendarItems(calendar, completion: {
      self.tableView.reloadData()
    })
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - UITableViewDataSource
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
    let item = calendar.items[indexPath.row]
    cell.textLabel?.text = "\(item.date) \(item.entryTitle)"
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return calendar.items.count
  }
  
  // MARK: - UITableDelegate
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    if calendar.items[indexPath.row].entryURL == "" {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
      return
    }

    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("AdventCalendarWebViewController") as! AdventCalendarWebViewController
    vc.item = calendar.items[indexPath.row]
    self.navigationController?.pushViewController(vc, animated: true)
  }

}

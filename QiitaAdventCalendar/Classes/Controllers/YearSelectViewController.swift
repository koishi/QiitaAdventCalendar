//
//  YearSelectViewController.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class YearSelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  private let cellIdentifier = "Cell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - UITableViewDataSource
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
    cell.textLabel?.text = YearManager.years[indexPath.row]
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return YearManager.years.count
  }
  
  // MARK: - UITableDelegate
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    //    if calendar.items[indexPath.row].entryURL == "" {
    //      tableView.deselectRowAtIndexPath(indexPath, animated: true)
    //      return
    //    }
    //
    //    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("AdventCalendarWebViewController") as! AdventCalendarWebViewController
    //    vc.item = calendar.items[indexPath.row]

    let vc = YearManager.rootViewController(YearManager.years[indexPath.row])
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
}

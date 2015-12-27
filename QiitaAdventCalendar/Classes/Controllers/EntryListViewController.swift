//
//  EntryListViewController.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class EntryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  private let cellIdentifier = "Cell"
  private let entryCellIdentifier = "EntryListTableViewCell"

  var calendar: CalendarEntity!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
  
    let nib = UINib(nibName: entryCellIdentifier, bundle: nil)
    tableView.registerNib(nib, forCellReuseIdentifier: entryCellIdentifier)
  
    navigationItem.title = calendar.title
    
    EntryManager.scrapingCalendarItems(calendar, completion: {
      self.tableView.reloadData()
    })
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - UITableViewDataSource
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(entryCellIdentifier) as! EntryListTableViewCell
    let item = calendar.items[indexPath.row]
    cell.date.text = item.date
    cell.title.text = item.entryTitle
    cell.name.text = item.authorName
    cell.icon.sd_setImageWithURL(NSURL(string: item.authorIconURL))
    return cell
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return calendar.items.count
  }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 62.0
  }

  // MARK: - UITableDelegate
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    if calendar.items[indexPath.row].entryURL == "" {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
      return
    }

    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("EntryWebViewController") as! EntryWebViewController
    vc.item = calendar.items[indexPath.row]
    self.navigationController?.pushViewController(vc, animated: true)
  }

}

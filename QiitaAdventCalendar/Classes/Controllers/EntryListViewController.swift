//
//  EntryListViewController.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit
import SafariServices

class EntryListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!

  var calendar: CalendarEntity!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    
    let nib = UINib(nibName: EntryListTableViewCell.cellIdentifier, bundle: nil)
    tableView.registerNib(nib, forCellReuseIdentifier: EntryListTableViewCell.cellIdentifier)
  
    navigationItem.title = calendar.title
    
    EntryManager.scrapingCalendarItems(calendar, completion: {
      self.tableView.reloadData()
    })
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

extension EntryListViewController: UITableViewDataSource {

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(EntryListTableViewCell.cellIdentifier) as! EntryListTableViewCell
    let item = calendar.items[indexPath.row]
    cell.date.text = item.date.stringByReplacingOccurrencesOfString("12 / ", withString: "")
    cell.title.text = item.entryTitle
    cell.name.text = item.authorName
    cell.icon.sd_setImageWithURL(NSURL(string: item.authorIconURL))
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return calendar.items.count
  }

}

extension EntryListViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    if calendar.items[indexPath.row].entryURL.isEmpty {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
      return
    }

    if #available(iOS 9.0, *) {
      if let url = NSURL.init(string: calendar.items[indexPath.row].entryURL) {
        let safariView = SFSafariViewController.init(URL: url)
        self.presentViewController(safariView, animated: true, completion: nil)
      }
    } else {
      let vc = self.storyboard?.instantiateViewControllerWithIdentifier(String(EntryWebViewController)) as! EntryWebViewController
      vc.item = calendar.items[indexPath.row]
      self.navigationController?.pushViewController(vc, animated: true)
    }
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }

  func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
}

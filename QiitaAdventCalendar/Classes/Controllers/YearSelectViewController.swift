//
//  YearSelectViewController.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class YearSelectViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private let cellIdentifier = "Cell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    navigationItem.title = "Qiita Advent Calendar"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

extension YearSelectViewController: UITableViewDataSource {

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
    cell.textLabel?.text = YearManager.years[indexPath.row]
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return YearManager.years.count
  }

}

extension YearSelectViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let vc = YearManager.rootViewController(YearManager.years[indexPath.row])
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
}

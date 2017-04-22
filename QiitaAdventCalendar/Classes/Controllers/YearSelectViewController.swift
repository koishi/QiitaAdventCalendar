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
  
  fileprivate let cellIdentifier = "Cell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    navigationItem.title = "Qiita Advent Calendar"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

extension YearSelectViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
    cell.textLabel?.text = YearManager.years[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return YearManager.years.count
  }

}

extension YearSelectViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = YearManager.rootViewController(YearManager.years[indexPath.row])
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
}

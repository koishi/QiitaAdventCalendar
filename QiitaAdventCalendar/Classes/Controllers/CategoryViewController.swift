//
//  CategoryViewController.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!

  private let cellIdentifier = "Cell"

  var year: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

    navigationItem.title = year

    CategoryManager.sharedInstance.scrapingCategories({
      self.tableView.reloadData()
    })
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

// MARK: - UITableViewDataSource

extension CategoryViewController: UITableViewDataSource {

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!

    let category = CategoryManager.sharedInstance.categories[indexPath.row]
    cell.textLabel?.text = category.title
    return cell
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return CategoryManager.sharedInstance.categories.count
  }

}

// MARK: - UITableDelegate

extension CategoryViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let vc = self.storyboard?.instantiateViewControllerWithIdentifier(String(CalendarViewController)) as! CalendarViewController
    vc.category = CategoryManager.sharedInstance.categories[indexPath.row]
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
}

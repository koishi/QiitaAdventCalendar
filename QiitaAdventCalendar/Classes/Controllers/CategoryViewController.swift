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
  
  var categories = [CategoryEntity]()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    navigationItem.title = year

    guard self.categories.count == 0 else {
      return
    }
    CategoryManager.scrapingCategories(year!, completion:  {
      categories in
      self.categories = categories
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

    let category = self.categories[indexPath.row]
    cell.textLabel?.text = category.title
    return cell
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.categories.count
  }

}

// MARK: - UITableDelegate

extension CategoryViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let vc = self.storyboard?.instantiateViewControllerWithIdentifier(String(CalendarViewController)) as! CalendarViewController
    vc.category = self.categories[indexPath.row]
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
}

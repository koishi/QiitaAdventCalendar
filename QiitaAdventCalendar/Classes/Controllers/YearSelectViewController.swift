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
    
    var years = [YearEntity]()
    
    fileprivate let cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        navigationItem.title = "Qiita Advent Calendar"
        
        
        YearFetcher.scrapingYearItems{ response in
            self.years = response
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension YearSelectViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        cell.textLabel?.text = years[indexPath.row].year
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return years.count
    }
    
}

extension YearSelectViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = YearFetcher.viewController(years[indexPath.row]) else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

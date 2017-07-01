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
        tableView.register(nib, forCellReuseIdentifier: EntryListTableViewCell.cellIdentifier)
        
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntryListTableViewCell.cellIdentifier) as! EntryListTableViewCell
        let item = calendar.items[indexPath.row]
        cell.date.text = item.date.replacingOccurrences(of: "12 / ", with: "")
        
        if item.entryTitle.isEmpty {
            cell.title.text = item.comment
        } else {
            cell.title.text = item.entryTitle
        }
        
        cell.name.text = item.authorName
        cell.icon.sd_setImage(with: URL(string: item.authorIconURL))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendar.items.count
    }
    
}

extension EntryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if calendar.items[indexPath.row].entryURL.isEmpty {
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        
        if #available(iOS 9.0, *) {
            if let url = URL.init(string: calendar.items[indexPath.row].entryURL) {
                let safariView = SFSafariViewController.init(url: url)
                self.present(safariView, animated: true, completion: nil)
            }
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: EntryWebViewController.self)) as! EntryWebViewController
            vc.item = calendar.items[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

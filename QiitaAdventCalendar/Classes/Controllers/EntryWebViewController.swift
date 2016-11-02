//
//  EntryWebViewController.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class EntryWebViewController: UIViewController {
  
  @IBOutlet weak var webView: UIWebView!

  var item: EntryEntity!

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = item.entryTitle
    
    let url = NSURL(string: item.entryURL)!
    webView.loadRequest(NSURLRequest(URL: url))
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
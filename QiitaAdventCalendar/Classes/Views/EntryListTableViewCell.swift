//
//  EntryListTableViewCell.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit
import SDWebImage

class EntryListTableViewCell: UITableViewCell {
  
  @IBOutlet weak var date: UILabel!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var icon: UIImageView!
  @IBOutlet weak var name: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}

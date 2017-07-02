//
//  YearListTableViewCell.swift
//  QiitaAdventCalendar
//
//  Created by 大石弘一郎 on 2017/07/02.
//  Copyright © 2017年 bs. All rights reserved.
//

import UIKit

class YearListTableViewCell: UITableViewCell {

    static let cellIdentifier = String(describing: YearListTableViewCell.self)

    var yearEntity: YearEntity? {
        didSet {
            year.text = yearEntity?.year
            
            if let countItem = yearEntity?.countItems[0] {
                content1.text = countItem.content
                value1.text = countItem.value
            }
            
            if let countItem = yearEntity?.countItems[1] {
                content2.text = countItem.content
                value2.text = countItem.value
            }

            if let countItem = yearEntity?.countItems[2] {
                content3.text = countItem.content
                value3.text = countItem.value
            }
        }
    }

    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var content1: UILabel!
    @IBOutlet weak var content2: UILabel!
    @IBOutlet weak var content3: UILabel!
    @IBOutlet weak var value1: UILabel!
    @IBOutlet weak var value2: UILabel!
    @IBOutlet weak var value3: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

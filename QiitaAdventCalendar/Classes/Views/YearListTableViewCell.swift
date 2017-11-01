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
            guard let yearEntity = yearEntity else {
                return
            }
            year.text = yearEntity.year

            let contents: [UILabel] = [content1, content2]
            let values: [UILabel] = [value1, value2]

            for (index, countItem) in yearEntity.countItems.enumerated() {
                contents[index].text = countItem.content
                values[index].text = countItem.value
            }

        }
    }

    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var content1: UILabel!
    @IBOutlet weak var content2: UILabel!
    @IBOutlet weak var value1: UILabel!
    @IBOutlet weak var value2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

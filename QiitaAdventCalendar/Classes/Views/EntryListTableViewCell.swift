//
//  EntryListTableViewCell.swift
//  QiitaAdventCalendar
//
//  Created by bs on 2015/12/27.
//  Copyright © 2015年 bs. All rights reserved.
//

import UIKit

class EntryListTableViewCell: UITableViewCell {
    
    static let cellIdentifier = String(describing: EntryListTableViewCell.self)

    var entryEntity: EntryEntity? {
      didSet {
        guard let entryEntity = entryEntity else { return }

        date.text = entryEntity.date.replacingOccurrences(of: "12 / ", with: "")
        if entryEntity.entryTitle.isEmpty {
            title.text = entryEntity.comment
        } else {
            title.text = entryEntity.entryTitle
        }

        name.text = entryEntity.authorName
        icon.kf.setImage(with: URL(string: entryEntity.authorIconURL))
      }
    }
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//
//  ChapterTableViewCell.swift
//  CeviriyleOgren
//
//  Created by MAC on 20.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ChapterTableViewCell: UITableViewCell {

    @IBOutlet weak var chapterDesc: UILabel!
    @IBOutlet weak var chapterTitle: UILabel!
    @IBOutlet weak var done: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

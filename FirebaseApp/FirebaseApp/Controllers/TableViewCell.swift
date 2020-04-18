//
//  TableViewCell.swift
//  FirebaseApp
//
//  Created by MAC on 17.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblCat: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var short: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

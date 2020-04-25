//
//  BookTableViewCell.swift
//  CeviriyleOgren
//
//  Created by MAC on 19.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var btnPrice: UIButton!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookDesc: UILabel!
    @IBOutlet weak var bookPage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        btnPrice.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

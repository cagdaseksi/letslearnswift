//
//  TopCategoryTableViewCell.swift
//  TemplateApp
//
//  Created by MAC on 17.10.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class TopCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnDownload: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        btnDownload.tintColor = .white
        
        // Configure the view for the selected state
    }

}

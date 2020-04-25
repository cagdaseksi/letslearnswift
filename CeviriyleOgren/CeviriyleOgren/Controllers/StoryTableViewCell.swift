//
//  StoryTableViewCell.swift
//  CeviriyleOgren
//
//  Created by MAC on 19.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var lblState: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

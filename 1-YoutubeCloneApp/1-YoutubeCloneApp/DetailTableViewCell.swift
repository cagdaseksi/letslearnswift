//
//  DetailTableViewCell.swift
//  1-YoutubeCloneApp
//
//  Created by MAC on 6.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailChannelName: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(video: Video) {
        detailTitle.text = video.title
        detailChannelName.text = video.channel
        detailDescription.text = video.detailDescription
        img.load(url: video.image_url)
    }

}

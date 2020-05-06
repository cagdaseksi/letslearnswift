//
//  DetailTableViewCell.swift
//  YoutubeApp
//
//  Created by MAC on 6.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var channel: UILabel!
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
          
        title.text = video.title
        detailDescription.text = video.detailDescription
        channel.text = video.channel
        img.load(url: video.image_url)
           
       }
    
}

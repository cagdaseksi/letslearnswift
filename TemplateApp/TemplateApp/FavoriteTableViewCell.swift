//
//  FavoriteTableViewCell.swift
//  TemplateApp
//
//  Created by MAC on 29.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepare(movie: Model) {
        //print(movie)
        lblTitle.text = "\(movie.id). \(movie.title)"
    }
    
}

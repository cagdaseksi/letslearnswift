//
//  MovieTableViewCell.swift
//  MoviesApp
//
//  Created by MAC on 13.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSummary: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var lbCategories: UILabel!
    
    func prepare(with movie: Movie){
        ivPoster.image = UIImage(named: movie.imageWide)
        lbTitle.text = movie.title
        lbSummary.text = movie.summary
        lbCategories.text = movie.categoriesDescription
        lbRating.text = "⭐️ \(movie.rating)/10"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

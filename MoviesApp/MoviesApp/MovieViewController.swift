//
//  MovieViewController.swift
//  MoviesApp
//
//  Created by MAC on 13.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

       @IBOutlet weak var ivPoster: UIImageView!
       @IBOutlet weak var lbTitle: UILabel!
       @IBOutlet weak var lbGenre: UILabel!
       @IBOutlet weak var lbDuration: UILabel!
       @IBOutlet weak var lbScore: UILabel!
       @IBOutlet weak var tvSinopsis: UITextView!
       @IBOutlet weak var lcButtonX: NSLayoutConstraint!
       
       
       var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivPoster.image = UIImage(named: movie.imageSmall)
        lbTitle.text = movie.title
        tvSinopsis.text = movie.summary
        lbGenre.text = movie.categoriesDescription
        lbDuration.text = movie.duration
        lbScore.text = "⭐️ \(movie.rating)/10"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

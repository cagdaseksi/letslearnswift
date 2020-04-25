//
//  HomeViewController.swift
//  QuizApp
//
//  Created by MAC on 24.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool){
        let score = defaults.string(forKey: "score") ?? "0"
        lblScore.text = "High Score: \(score)"
    }

}

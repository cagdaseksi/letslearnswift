//
//  ViewController.swift
//  Shadow
//
//  Created by MAC on 20.03.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myImage.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        myImage.layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
        myImage.layer.shadowOpacity = 1.0
        myImage.layer.shadowRadius = 2.0
        myImage.layer.masksToBounds = false
        myImage.layer.cornerRadius = 4.0
        
        
    }


}


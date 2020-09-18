//
//  ViewController.swift
//  ChangeButtonColor
//
//  Created by MAC on 4.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        
        sender.backgroundColor = sender.backgroundColor == UIColor.red ? UIColor.black : UIColor.red
        
    }
    
}


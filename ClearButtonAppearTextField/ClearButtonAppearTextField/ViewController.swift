//
//  ViewController.swift
//  ClearButtonAppearTextField
//
//  Created by MAC on 5.08.2019.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textField.clearButtonMode = .always
        textField.clearButtonMode = .whileEditing
        
    }


}


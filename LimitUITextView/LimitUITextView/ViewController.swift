//
//  ViewController.swift
//  LimitUITextView
//
//  Created by MAC on 2.08.2019.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtContent: UITextField!
    @IBOutlet weak var lblNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtContent.delegate = self
        
    }

    // shouldChangeCharactersIn
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {
            return false
        }
        
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        lblNumber.text = "\(16 - updateText.count)"
        
        return updateText.count < 16
    }

}


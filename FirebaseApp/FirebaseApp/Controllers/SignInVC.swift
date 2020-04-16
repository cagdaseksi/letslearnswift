//
//  SignInVC.swift
//  FirebaseApp
//
//  Created by MAC on 16.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        if passwordText.text != "" && emailText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (result, error) in
                if error != nil {
                    Common.showAlert(with: error?.localizedDescription ?? "Error", vc: self)
                    print(error?.localizedDescription ?? "Error")
                } else {
                    
                    self.tabBarController?.selectedIndex = 0
                }
            }

        } else {
            Common.showAlert(with: "Password/Email ?", vc: self)
        }
        
        
    }

}

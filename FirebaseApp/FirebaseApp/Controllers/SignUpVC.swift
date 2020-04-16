//
//  SignUpVC.swift
//  FirebaseApp
//
//  Created by MAC on 16.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        
        if (confirmPasswordText.text == passwordText.text && passwordText.text != "" && emailText.text != "") {
            
            createUser(email: self.emailText.text!, password: passwordText.text!)
            
        } else {
            Common.showAlert(with: "Email/Password ?", vc: self)
        }
        
    }
    
    func createUser(email: String, password: String){
          Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
              if error != nil {
                  Common.showAlert(with: error?.localizedDescription ?? "Error", vc: self)
              }else {
                
                _ = self.navigationController?.popToRootViewController(animated: true)
                
                //self.performSegue(withIdentifier: "toFeed", sender: nil)
            }
          }
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

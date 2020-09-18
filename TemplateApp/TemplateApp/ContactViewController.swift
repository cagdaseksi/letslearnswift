//
//  ContactViewController.swift
//  TemplateApp
//
//  Created by MAC on 29.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btn.layer.cornerRadius = 10
        
    }
    
    @IBAction func btn(_ sender: Any) {
        
        if let url = URL(string: "https://www.instagram.com/ceviriyleogren/") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
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

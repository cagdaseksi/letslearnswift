//
//  ViewController.swift
//  WeatherApp
//
//  Created by MAC on 14.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btn.layer.cornerRadius = 6
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func btn(_ sender: Any) {
        
        let city = textField.text ?? ""
        
        if city.isEmpty {
            
            let alert = UIAlertController(title: "Uyarı!", message: "Lütfen şehir adını boş bırakmayınız.", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(cancelButton)
            
            self.present(alert, animated: true, completion: nil)
            
        }else{
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            
            vc.city = city
            
            self.show(vc, sender: nil)
            
            
        }
        
    }
    

}


//
//  ViewController.swift
//  NumberApp
//
//  Created by MAC on 13.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var random: UILabel!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var star: UILabel!
    @IBOutlet weak var message: UILabel!
    
    var heart = 0
    var correct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDefaultData()
        
    }

    @IBAction func btn(_ sender: Any) {
        
        
        let number1 = number.text ?? ""
        
        if let n1 = Int(number1) {
            
            help(number: n1)
            
            if correct == n1 {
                print("correct")
                random.text = "\(correct)"
                defaultAlert(title: "⭐️ CONGRATULATIONS ⭐️", message: "Rekorları alt üst ettin.")
            }else {
                heart = heart - 1
                if heart < 1 {
                    print("game over")
                    random.text = "\(correct)"
                    defaultAlert(title: "GAME OVER", message: "Üzülme yeniden oynayabilirsin.")
                }
                
                heartCalculator(heart: heart)
                
            }
            
        }
        
    }
    
    func loadDefaultData() {
        
        btn.layer.cornerRadius = 6
        random.text = "?"
        star.text = "⭐️ ⭐️ ⭐️"
        heart = 3
        number.text = ""
        message.text = ""
        correct = Int(arc4random_uniform(UInt32(10)))
    }
    
    func heartCalculator(heart:Int){
        
        switch heart {
            case 3:
                star.text = "⭐️ ⭐️ ⭐️"
            case 2:
               star.text = "⭐️ ⭐️"
            case 1:
               star.text = "⭐️"
        default:
               star.text = ""
        }
        
    }
    
    func defaultAlert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                self.loadDefaultData()
              case .cancel:
                    print("cancel")
              default:
                print("")

        }}))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func help(number:Int) {
        
        message.text = correct > number ? "Yukarı" : "Aşağı"
        
    }
    
}


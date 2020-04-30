//
//  ViewController.swift
//  QuizApp
//
//  Created by MAC on 24.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let questions = ["Simyacı kitabının yazarı kim?", "Gezegenler isimlerini nereden alıyor?", "Güneş sistemimizde kaç gezegen var?"]
    let answers = [["Paulo Coelho", "Osho", "Lev Tolstoy"], ["Onları keşfeden bilim adamlarından.", "Yunan Tanrılarından.", "Latince kelimelerden."], ["8", "9", "10"]]

    
    
    //Variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var score = 0
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnA.layer.cornerRadius = 10
        btnB.layer.cornerRadius = 10
        btnC.layer.cornerRadius = 10
    }
    
    @IBAction func btn(_ sender: UIButton) {
        
        if (sender.tag == Int(rightAnswerPlacement))
        {
            print ("RIGHT!")
            score += 1
        }
        else
        {
            print ("WRONG!!!!!!")
        }
        
        if (currentQuestion != questions.count)
        {
            newQuestion()
        }
        else
        {
            defaults.set(String(score), forKey: "score")
            defaults.synchronize()
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        newQuestion()
    }
    
    func newQuestion()
    {
        lblTitle.text = questions[currentQuestion]
        
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        //Create a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3
        {
            //Create a button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1
    }
}

//
//  ViewController.swift
//  NavigationBar
//
//  Created by MAC on 25.07.2019.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        
        navigationItem.title = "Navigation Bar"
        
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraTapped))
        let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(playTapped))
        
        navigationItem.rightBarButtonItems = [camera,play]
        
    }

    @objc func editTapped() {
        print("editTapped.")
    }
    
    @objc func addTapped() {
        print("addTapped.")
    }
    
    @objc func cameraTapped() {
        print("cameraTapped.")
    }
    
    @objc func playTapped() {
        print("playTapped.")
    }

}


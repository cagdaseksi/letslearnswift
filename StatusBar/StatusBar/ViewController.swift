//
//  ViewController.swift
//  StatusBar
//
//  Created by MAC on 12.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Status Bar Height
        
        let height = UIApplication.shared.statusBarFrame.height
        print("Status bar height: \(height)")
        
        //Status Bar width
        
        let width = UIApplication.shared.statusBarFrame.width
        print("Status bar width: \(width)")
        
        // ios 13
        
        let windowHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        print("Status bar height (ios 13): \(windowHeight)")
        
        let windowWidth = view.window?.windowScene?.statusBarManager?.statusBarFrame.width ?? 0
        print("Status bar width (ios 13): \(windowWidth)")
        
    }
}

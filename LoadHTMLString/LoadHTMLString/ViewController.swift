//
//  ViewController.swift
//  LoadHTMLString
//
//  Created by MAC on 25.07.2019.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let body = """
            <h1>This is a Heading</h1>
            <p>This is a paragraph.</p>
        """
        
        let html = """
            <!DOCTYPE html>
            <html>
            <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta charset="UTF-8">
            <title>Let's Learn Swift</title>
            <style> body { font-size: 22px; } </style>
            </head>
            <body>
            \(body)
            </body>
            </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
        
    }


}


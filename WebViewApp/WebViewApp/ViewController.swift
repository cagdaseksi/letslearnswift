//
//  ViewController.swift
//  WebViewApp
//
//  Created by MAC on 2.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    let search = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webkit: WKWebView!
    
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var btnGo: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnBack.isEnabled = false
        btnGo.isEnabled = false
        
        textField.delegate = self
        webkit.navigationDelegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

       let urlString : String = "https://www.youtube.com" // url değeri
       let url : URL = URL(string: urlString)! // unwrapping işlemi
       let urlRequest : URLRequest = URLRequest(url: url) // request işlemi
       webkit.load(urlRequest) // load işlemi
       
       textField.text = urlString // text değerine ekleme
        
       }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let urlString : String = textField.text! // text değerini alır.
        let url : URL = URL(string: urlString)! // url değerine eşitlenir.
        let urlRequest : URLRequest = URLRequest(url: url) // istek tanımlanır.
        webkit.load(urlRequest) // istek yüklenir.
        
        textField.resignFirstResponder() // bulunan durumdan diğerine geçiş sağlanır.
        
        return true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        btnBack.isEnabled = webkit.canGoBack
        btnGo.isEnabled = webkit.canGoForward
        
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        if webkit.canGoBack{ //  geriye gidebiliyorsa
            webkit.goBack() // web kısmında geriye git.
            textField.text = webkit.url?.absoluteString
        }
    }
    
    @IBAction func btnGo(_ sender: Any) {
        if webkit.canGoForward{ //  ileriye gittiyse
            webkit.goForward() // ileriye git
            textField.text = webkit.url?.absoluteString
        }
    }
}


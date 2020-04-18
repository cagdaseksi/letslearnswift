//
//  UploadVC.swift
//  FirebaseApp
//
//  Created by MAC on 16.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import Firebase

class UploadVC: UIViewController {

    @IBOutlet weak var category: UISegmentedControl!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDesc: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func category(_ sender: Any) {
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        let title = txtTitle.text ?? ""
        let desc = txtDesc.text ?? ""
        let cat = category.titleForSegment(at: category.selectedSegmentIndex) ?? ""
        
        let currentUser = Auth.auth().currentUser
        
        if currentUser == nil {
            Common.showAlert(with: "Please Login", vc: self)
            
            return
        }
        
        let newItem: Dictionary<String, Any> = [
           "title": title,
           "desc": desc,
           "type": cat,
           "email": currentUser?.email
        ]
        self.createNewItem(item: newItem)
        
    }
    
    func createNewItem(item: Dictionary<String, Any>) {
        let firebaseNewItem = DataService.dataService.ITEM_REF.childByAutoId()
        
        firebaseNewItem.setValue(item) { (error: Error?, ref: DatabaseReference)  -> Void in
            if error == nil {
                self.tabBarController?.selectedIndex = 0
                
                self.txtTitle.text = ""
                self.txtDesc.text = ""
                
            } else {
                Common.showAlert(with: (error?.localizedDescription)!, vc: self)
            }
        }
    }
    

}

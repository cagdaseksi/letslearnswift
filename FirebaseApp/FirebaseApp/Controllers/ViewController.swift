//
//  ViewController.swift
//  FirebaseApp
//
//  Created by MAC on 16.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var items = [ItemModel]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAdd: UIBarButtonItem!
    @IBOutlet weak var navMenu: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.retrieveItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        if let currentUser = Auth.auth().currentUser {
            navMenu.topItem!.title = currentUser.email
        }
    }
    
    @IBAction func btnLogout(_ sender: Any) {
        
       do{
            try Auth.auth().signOut()
            Common.showAlert(with: "OK", vc: self)
        }catch{
            Common.showAlert(with: "Error", vc: self)
        }
        
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let row = self.items[indexPath.row]
        
        cell.title.text = row.title
        cell.short.text = row.desc
        cell.lblCat.text = row.type
        
        cell.btnStar.setImage(UIImage(systemName: row.like == 0 ? "star" : "star.fill"), for: .normal)
        
        
        cell.btnStar.tag = indexPath.row
        cell.btnComment.tag = indexPath.row
        cell.btnDelete.tag = indexPath.row
        
        cell.btnComment.addTarget(self, action: #selector(btnComment), for: .touchUpInside)
        cell.btnStar.addTarget(self, action: #selector(btnStar), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(btnDelete), for: .touchUpInside)
        
        cell.btnDelete.isHidden = !checkCurrentUser(email: row.email)
        
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func btnComment(_ sender: UIButton) {
        
        print(sender.tag)
        
    }
    
    @objc func btnStar(_ sender: UIButton) {
        
        print(sender.tag)
        
        let myIndexPath = NSIndexPath(row: sender.tag, section: 0)
        let cell = tableView.cellForRow(at: myIndexPath as IndexPath) as! TableViewCell
        
        cell.btnStar.setImage(UIImage(systemName: "star.fill"), for: .normal)

        self.updateItem(item: self.items[sender.tag])
        
    }
    
    @objc func btnDelete(_ sender: UIButton) {
        print(sender.tag)
        self.deleteItem(item: self.items[sender.tag])
    }
    
    func retrieveItems() {
        DataService.dataService.ITEM_REF.observe(.value, with: { (snapshot: DataSnapshot?) in
            
            if let snapshots = snapshot?.children.allObjects as? [DataSnapshot] {
                self.items.removeAll()
                
                for snap in snapshots {
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let itemModel = ItemModel(key: snap.key, dictionary: postDictionary)
                        self.items.insert(itemModel, at: 0)
                    }
                }
            }
            
            self.tableView.reloadData()
        })
    }
    
    func deleteItem(item: ItemModel) {
        DataService.dataService.ITEM_REF.child(item.key).removeValue { (error: Error?, ref: DatabaseReference) in
            if error != nil {
                Common.showAlert(with: (error?.localizedDescription)!, vc: self)
            }else {
                Common.showAlert(with: "OK", vc: self)
            }
        }
    }
    
    func updateItem(item: ItemModel) {
        
        DataService.dataService.ITEM_REF.child(item.key).updateChildValues(["like": item.like == 0 ? 1 : 0])
    }
    
    func checkCurrentUser(email:String) -> Bool{
        
        print(email)
       
        if let currentUser = Auth.auth().currentUser {
             print("cur \(currentUser.email)")
            return email == currentUser.email
            
        }
        
        return false
    }
}


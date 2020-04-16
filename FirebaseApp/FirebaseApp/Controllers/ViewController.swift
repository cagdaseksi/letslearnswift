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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let list = [1,2,3,4,5,6,7,8]
        
        for (index, element) in list.enumerated() {
          print("Item \(index): \(element)")
        }
        
        self.retrieveItems()
    }

    @IBAction func btnAdd(_ sender: Any) {
        let newItem: Dictionary<String, Any> = [
                   "name": "Item\(self.items.count + 1)",
                   "quantity": 2,
                   "type": "electronic"
               ]
               self.createNewItem(item: newItem)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.items[indexPath.row].name
        cell.detailTextLabel?.text = self.items[indexPath.row].type
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            self.deleteItem(item: self.items[indexPath.row], with:  indexPath)
        }
    }
    
    func createNewItem(item: Dictionary<String, Any>) {
        let firebaseNewItem = DataService.dataService.ITEM_REF.childByAutoId()
        
        firebaseNewItem.setValue(item) { (error: Error?, ref: DatabaseReference)  -> Void in
            if error == nil {
                self.retrieveItems()
            } else {
                Common.showAlert(with: (error?.localizedDescription)!, vc: self)
            }
        }
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
    
    func deleteItem(item: ItemModel, with indexPath: IndexPath) {
        DataService.dataService.ITEM_REF.child(item.key).removeValue { (error: Error?, ref: DatabaseReference) in
            if error != nil {
                Common.showAlert(with: (error?.localizedDescription)!, vc: self)
            }
        }
    }
    
}


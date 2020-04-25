//
//  BookDetailViewController.swift
//  FirebaseApp
//
//  Created by MAC on 19.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import Firebase

class BookDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var items = [CategoryModel]()
    var category = ""
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveItems(child: category)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let row = self.items[indexPath.row]
        
        cell.textLabel!.text = row.title
        cell.detailTextLabel!.text = row.desc
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
         let row = self.items[indexPath.row]
         print(row.key)
         performSegue(withIdentifier: "toChapters", sender: row.key)
         
     }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
     let des = segue.destination as? BookChapterVC
     des?.category = category
     des?.book = sender as! String
        
     }
    
    func retrieveItems(child: String) {
    
    DataService.dataService.CATEGORY_REF.child(child).observe(.value, with: { (snapshot: DataSnapshot?) in
            
            if let snapshots = snapshot?.children.allObjects as? [DataSnapshot] {
                self.items.removeAll()
                
                for snap in snapshots {
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let itemModel = CategoryModel(key: snap.key, dictionary: postDictionary)
                        self.items.insert(itemModel, at: 0)
                    }
                }
            }
            
            self.tableView.reloadData()
        })
    }

}


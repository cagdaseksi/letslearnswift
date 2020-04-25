//
//  BookChapterVC.swift
//  FirebaseApp
//
//  Created by MAC on 19.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import Firebase

class BookChapterVC: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var items = [CategoryModel]()
     var category = ""
     var book = ""
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveItems(category: category, book: book)
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
         performSegue(withIdentifier: "toParagrafs", sender: row.key)
         
     }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        let des = segue.destination as? BookParagrafVC
        des?.category = category
        des?.book = book
        des?.chapter = sender as! String
     
     }
    
    func retrieveItems(category: String, book: String) {
    
        DataService.dataService.CATEGORY_REF.child(category).child(book).observe(.value, with: { (snapshot: DataSnapshot?) in
            
            if let snapshots = snapshot?.children.allObjects as? [DataSnapshot] {
                self.items.removeAll()
                print(snapshots.count)
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

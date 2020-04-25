//
//  BookParagrafVC.swift
//  FirebaseApp
//
//  Created by MAC on 19.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import Firebase

class BookParagrafVC: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var items = [CategoryModel]()
    var category = ""
    var book = ""
    var chapter = ""
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveItems(category: category, book: book, chapter: chapter)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookTableViewCell
        
        let row = self.items[indexPath.row]
        
        cell.lblParagraf.text = row.en
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        let row = self.items[indexPath.row]
        
        let status = row.status ? false : true
        
        self.items[indexPath.row].status = status
        
        tableView.beginUpdates()
        let myIndexPath = NSIndexPath(row: indexPath.row, section: 0)
        let cell = tableView.cellForRow(at: myIndexPath as IndexPath) as! BookTableViewCell
        
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        UITableViewCell.transition(with: cell, duration: 1.0, options: transitionOptions, animations: {
            cell.lblParagraf.text = status ? row.tr : row.en
            //tableView.reloadRows(at: [indexPath], with: .top)
        })
        tableView.endUpdates()
     }
     
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
    
    func retrieveItems(category: String, book: String, chapter: String) {
    
        DataService.dataService.CATEGORY_REF.child(category).child(book).child(chapter).observe(.value, with: { (snapshot: DataSnapshot?) in
            
            if let snapshots = snapshot?.children.allObjects as? [DataSnapshot] {
                self.items.removeAll()
                print(snapshots.count)
                for snap in snapshots {
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let itemModel = CategoryModel(key: snap.key, dictionary: postDictionary)
                        self.items.append(itemModel)
                    }
                }
            }
            
            self.tableView.reloadData()
        })
    }

}

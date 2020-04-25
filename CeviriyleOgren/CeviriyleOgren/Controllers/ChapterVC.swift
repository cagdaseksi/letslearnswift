//
//  ChapterVC.swift
//  CeviriyleOgren
//
//  Created by MAC on 19.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import Firebase

class ChapterVC: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var items = [CategoryModel]()
    
    var tasks = [[CategoryModel](), [CategoryModel]()]
    
     var category = ""
     var book = ""
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveItems(category: category, book: book)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChapterTableViewCell
        
        let row = self.tasks[indexPath.section][indexPath.row] //self.items[indexPath.row]
        
        cell.chapterTitle.text = row.title
        cell.chapterDesc.text = row.desc
        cell.done.tag = indexPath.row
        cell.done.addTarget(self, action: #selector(done), for: .touchUpInside)
        
        //cell.textLabel!.text = row.title
        //cell.detailTextLabel!.text = row.desc
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Okunmayanlar" : "Okunanlar"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
         let row = self.tasks[indexPath.section][indexPath.row]
         print(row.key)
         performSegue(withIdentifier: "toParagraph", sender: row.key)
         
     }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        let des = segue.destination as? ParagraphVC
        des?.category = category
        des?.book = book
        des?.chapter = sender as! String
     
     }
    
    @objc func done(_ sender: UISwitch){
        
        print(sender.tag)
        
        let row = self.tasks[0][sender.tag]
        
        updateItem(item: row)
        
    }
    
    func updateItem(item: CategoryModel) {
        
        
    }
    
    func retrieveItems(category: String, book: String) {
    
        DataService.dataService.CATEGORY_REF.child(category).child(book).observe(.value, with: { (snapshot: DataSnapshot?) in
            
            if let snapshots = snapshot?.children.allObjects as? [DataSnapshot] {
                self.items.removeAll()
                print(snapshots.count)
                for snap in snapshots {
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let itemModel = CategoryModel(key: snap.key, dictionary: postDictionary)
                        
                        let section = itemModel.isDone ? 1 : 0
                        
                        self.tasks[section].append(itemModel)
                    }
                }
            }
            self.tableView.reloadData()
        })
    }

}


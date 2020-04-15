//
//  ViewController.swift
//  MySpecialGallery
//
//  Created by MAC on 14.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var images = [ImageEntity]()
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func viewWillAppear(_ animated: Bool) {
         LoadData()
    }
    
    func LoadData() {
        images = DataBaseHelper.shareInstance.fetchImage()
        myTableView.reloadData()
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let row = images[indexPath.row]
        
        if let data = row.image {
            cell.img.image = UIImage(data: data)
        }else {
            cell.img.image = nil
        }
        
        cell.title.text = row.title
        cell.shortdescription.text = row.shortdescription
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let row = images[indexPath.row]
            images.remove(at: indexPath.row)
            DataBaseHelper.shareInstance.deleteData(title: row.title!)
            self.myTableView.reloadData()
            
        }
        
    }
    
}


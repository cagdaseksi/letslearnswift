//
//  DetailViewController.swift
//  TemplateApp
//
//  Created by MAC on 28.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

var favoriteList:[Int] = [Int]()

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var movie:Model = Model()
    @IBOutlet weak var star: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableView.separatorStyle = .none

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.title = movie.title
        
        favoriteList = UserDefaults.standard.array(forKey: "favoriteList") as? [Int] ?? [Int]()
        
        star.image = favoriteList.contains(movie.id) ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        
    }

    @IBAction func star(_ sender: Any) {
        
        favoriteList = UserDefaults.standard.array(forKey: "favoriteList") as? [Int] ?? [Int]()
        
        if favoriteList.contains(movie.id) {
            favoriteList = favoriteList.filter { $0 != movie.id }
            star.image = UIImage(systemName: "star")
        }else {
            favoriteList.append(movie.id)
            star.image = UIImage(systemName: "star.fill")
        }
        
        //print(favoriteList)
        
        UserDefaults.standard.setValue(favoriteList, forKey: "favoriteList")
        UserDefaults.standard.synchronize()
        
        //print(UserDefaults.standard.array(forKey: "favoriteList") as! [Int])
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movie.details.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell

        let row = movie.details[indexPath.row]
        
        cell.title.text = row.en

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = self.movie.details[indexPath.row]
       
       let rStatus = row.status ?? false
        
       let status = rStatus ? false : true
       
       self.movie.details[indexPath.row].status = status
       
       tableView.beginUpdates()
       let myIndexPath = NSIndexPath(row: indexPath.row, section: 0)
       let cell = tableView.cellForRow(at: myIndexPath as IndexPath) as! DetailTableViewCell
       
       let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
       UITableViewCell.transition(with: cell, duration: 1.0, options: transitionOptions, animations: {
           cell.title.text = status ? row.tr : row.en
           //tableView.reloadRows(at: [indexPath], with: .top)
       })
       tableView.endUpdates()
    }

}

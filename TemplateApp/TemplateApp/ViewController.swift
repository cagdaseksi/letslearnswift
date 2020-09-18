//
//  ViewController.swift
//  TemplateApp
//
//  Created by MAC on 28.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   var movies = [Model]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }

    func loadData(){
        
        guard let jsonUrl = Bundle.main.url(forResource: "jokes", withExtension: "json"), let data = try? Data(contentsOf: jsonUrl) else {
            print("jokes")
            return
        }
        
        do {
            movies = try JSONDecoder().decode([Model].self, from: data)
            print(movies.count)
            tableView.layer.style = .none
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        let row = movies[indexPath.row]
        
        cell.prepare(movie: row)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = movies[indexPath.row]
       
        performSegue(withIdentifier: "toDetail", sender: row)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            
            let desVC = segue.destination as! DetailViewController
            desVC.movie = (sender as! Model)
            
            
        }
        
    }

}


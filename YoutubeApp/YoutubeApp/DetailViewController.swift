//
//  DetailViewController.swift
//  YoutubeApp
//
//  Created by MAC on 6.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var videos = [Video]()
    var video: Video!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
    }

    func loadData(){
           
           guard let jsonUrl = Bundle.main.url(forResource: "videos", withExtension: "json"), let data = try? Data(contentsOf: jsonUrl) else {
               print("videos")
               return
           }
           
            DispatchQueue.main.async {
                do {
                    self.videos = try JSONDecoder().decode([Video].self, from: data)
                    self.tableView.rowHeight = 100
                    self.tableView.reloadData()
                } catch {
                  print(error.localizedDescription)
                }
            }
           
       }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell

        let row = videos[indexPath.row]
        
        cell.prepare(video: row)

        return cell
    }


}



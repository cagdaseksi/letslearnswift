//
//  ViewController.swift
//  YoutubeApp
//
//  Created by MAC on 5.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var videos = [Video]()
    
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
                    self.tableView.rowHeight = 330
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell

        let row = videos[indexPath.row]
        
        cell.prepare(video: row)

        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! DetailViewController
        guard let row = tableView.indexPathForSelectedRow?.row else { return }
        
        let video = videos[row]
        vc.video = video
    
    }
    
}


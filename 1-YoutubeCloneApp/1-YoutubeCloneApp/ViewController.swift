//
//  ViewController.swift
//  1-YoutubeCloneApp
//
//  Created by MAC on 6.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var videos = [Video]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loaData()
    }
    
    func loaData() {
        
        guard let jsonUrl = Bundle.main.url(forResource: "videos", withExtension: "json"), let data = try? Data(contentsOf: jsonUrl) else {
            return
        }
        
        DispatchQueue.main.async {
            
            do {
                
                self.videos = try JSONDecoder().decode([Video].self, from: data)
                self.tableView.rowHeight = 310
                self.tableView.reloadData()
            }catch {
                print(error.localizedDescription)
            }
            
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
        
        let video = videos[indexPath.row]
        
        cell.prepare(video: video)
                
        return cell
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! DetailViewController
        guard let row = tableView.indexPathForSelectedRow?.row else { return }
        
        let video = self.videos[row]
        
        vc.video = video
        
    }
    
    
}


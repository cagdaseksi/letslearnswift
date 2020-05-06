//
//  DetailViewController.swift
//  YoutubeApp
//
//  Created by MAC on 6.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var videos = [Video]()
    var video: Video!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var channelName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        
        tags.text = video.tag
        detailTitle.text = video.title
        detailDescription.text = video.detailDescription
        channelName.text = video.channel
        let urlRequest : URLRequest = URLRequest(url: video.video_url)
        webView.load(urlRequest)
    }

    func loadData(){
           
           guard let jsonUrl = Bundle.main.url(forResource: "videos", withExtension: "json"), let data = try? Data(contentsOf: jsonUrl) else {
               print("videos")
               return
           }
           
            DispatchQueue.main.async {
                do {
                    self.videos = try JSONDecoder().decode([Video].self, from: data)
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



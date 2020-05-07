//
//  DetailViewController.swift
//  1-YoutubeCloneApp
//
//  Created by MAC on 6.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var videos = [Video]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var tag: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var dTitle: UILabel!
    @IBOutlet weak var channelname: UILabel!
    
    var video: Video!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loaData()
        
        tag.text = video.tag
        dTitle.text = video.title
        detailDescription.text = video.detailDescription
        channelname.text = video.channel
        
        let urlrequest = URLRequest(url: video.video_url)
        webView.load(urlrequest)
        
    }
    
    func loaData() {
        
        guard let jsonUrl = Bundle.main.url(forResource: "videos", withExtension: "json"), let data = try? Data(contentsOf: jsonUrl) else {
            return
        }
        
        DispatchQueue.main.async {
            
            do {
                
                self.videos = try JSONDecoder().decode([Video].self, from: data)
                self.tableView.rowHeight = 120
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell
        
        let video = videos[indexPath.row]
        
        cell.prepare(video: video)
                
        return cell
        
    }

}

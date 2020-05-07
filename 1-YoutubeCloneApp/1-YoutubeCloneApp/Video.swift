//
//  Video.swift
//  1-YoutubeCloneApp
//
//  Created by MAC on 6.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation

struct Video: Decodable {
    let title: String
    let channel: String
    let view: String
    let date: String
    let video_key: String
    let tags: [String]
    
    var image_url: URL {
        return URL(string: "https://img.youtube.com/vi/\(video_key)/0.jpg")!
    }
    
    var video_url : URL {
        return URL(string: "https://www.youtube.com/embed/\(video_key)")!
    }

    var tag: String {
        return tags.shuffled().joined(separator: " ")
    }
    
    var shortDescription: String {
        return "\(channel) - \(view) - \(date)"
    }
    
    var detailDescription: String {
        return "\(view) - \(date)"
    }
    
}

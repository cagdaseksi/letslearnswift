//
//  Movie.swift
//  MoviesApp
//
//  Created by MAC on 13.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation

struct Movie: Codable{
    let title: String
    let categories: [String]
    let duration: String
    let rating: Double
    let summary: String
    let imageName: String
    
    var imageSmall: String{
        return imageName + "-small.jpg"
    }
    
    var imageWide: String{
        return imageName + "-wide.jpg"
    }
    
    var categoriesDescription: String{
        return categories.joined(separator: " | ")
    }
    
    enum CodingKeys: String, CodingKey{
        case title
        case categories
        case duration
        case rating
        case summary
        case imageName = "image_name"
    }
}

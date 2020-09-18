//
//  Model.swift
//  TemplateApp
//
//  Created by MAC on 28.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation

struct Model: Codable{
    let id: Int
    let title: String
    let subTitle: String
    var details: [Language]
    
    init() {
        self.id = 0
        self.title = String()
        self.subTitle = String()
        self.details = [Language]()
    }
    
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case subTitle
        case details
    }
}

struct Language: Codable {
    let en: String
    let tr: String
    var status: Bool?
    
    init() {
        self.en = String()
        self.tr = String()
        self.status = false
    }
    
    enum CodingKeys: String, CodingKey{
        case en
        case tr
        case status
    }
    
}

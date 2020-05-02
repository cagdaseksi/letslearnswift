//
//  Util.swift
//  SansOyunlariApp
//
//  Created by MAC on 1.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation

struct Date {
    
    var date: String
    var value: String
    
    init(_ dictionary: [String: Any]) {
        self.date = dictionary["tarihView"] as? String ?? ""
        self.value = dictionary["tarih"] as? String ?? ""
    }
    
}

struct Result {
    
    var numbers: String
    
    init(_ dictionary: [String: Any]) {
        self.numbers = dictionary["rakamlarNumaraSirasi"] as? String ?? ""
    }
    
}

//
//  ItemModel.swift
//  FirebaseApp
//
//  Created by MAC on 16.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation
import Firebase

class ItemModel: NSObject {

    private var _ref: DatabaseReference!
    
    private var _key: String!
    private var _type: String!
    private var _name: String!
    private var _quantity: Int!
    
    var key: String {
        return _key
    }
    
    var name: String {
        return _name
    }
    
    var quantity: Int {
        return _quantity
    }
    
    var type: String {
        return _type
    }
    
    // Initialize the new Joke
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._key = key
        
        // Within the Joke, or Key, the following properties are children
        
        if let quantity = dictionary["quantity"] as? Int {
            self._quantity = quantity
        }
        
        if let type = dictionary["type"] as? String {
            self._type = type
        }
        
        if let name = dictionary["name"] as? String {
            self._name = name
        } else {
            self._name = ""
        }
        
        // The above properties are assigned to their key.
        
        self._ref =   DataService.dataService.ITEM_REF.child(self._key) //DataService.dataService.JOKE_REF.childByAppendingPath(self._jokeKey)
    }
}

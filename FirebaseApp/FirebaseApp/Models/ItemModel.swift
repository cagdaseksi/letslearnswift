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
    private var _title: String!
    private var _desc: String!
    private var _email: String!
    private var _like: Int! = 0
    private var _type: String!
    
    var key: String {
        return _key
    }
    
    var title: String {
        return _title
    }
    
    var desc: String {
           return _desc
    }
    
    var email: String {
           return _email
    }
    
    var type: String {
           return _type
    }
    
    var like: Int {
        return _like
    }
    
    // Initialize the new Joke
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._key = key
        
        // Within the Joke, or Key, the following properties are children
        
        if let like = dictionary["like"] as? Int {
            self._like = like
        }
        
        if let email = dictionary["email"] as? String {
            self._email = email
        }
        
        if let desc = dictionary["desc"] as? String {
            self._desc = desc
        }
        
        if let type = dictionary["type"] as? String {
            self._type = type
        }
        
        if let title = dictionary["title"] as? String {
            self._title = title
        } else {
            self._title = ""
        }
        
        // The above properties are assigned to their key.
        self._ref =   DataService.dataService.ITEM_REF.child(self._key) //DataService.dataService.JOKE_REF.childByAppendingPath(self._jokeKey)
    }
}


class CategoryModel: NSObject {

    private var _ref: DatabaseReference!
    
    private var _key: String!
    private var _title: String!
    private var _desc: String!
    
    private var _en: String! = ""
    private var _tr: String! = ""
    var status: Bool! = false
    
    var key: String {
        return _key
    }
    
    var title: String {
        return _title
    }
    
    var desc: String {
           return _desc
    }
    
    var en: String {
       return _en
    }

    var tr: String {
          return _tr
    }

    // Initialize the new Joke
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._key = key
        
        if let desc = dictionary["shortDescription"] as? String {
            self._desc = desc
        }
        
        if let title = dictionary["title"] as? String {
            self._title = title
        } else {
            self._title = ""
        }
        
        if let en = dictionary["en"] as? String {
                   self._en = en
        }
        
        if let tr = dictionary["tr"] as? String {
                   self._tr = tr
        }
        
        if let status = dictionary["status"] as? Bool {
                   self.status = status
        }
        
        
        // The above properties are assigned to their key.
        self._ref =   DataService.dataService.ITEM_REF.child(self._key) //DataService.dataService.JOKE_REF.childByAppendingPath(self._jokeKey)
    }
}

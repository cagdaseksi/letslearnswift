//
//  CoreData.swift
//  TemplateApp
//
//  Created by MAC on 17.10.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import CoreData
import UIKit

func getAll_TopCategories() -> [TopCategoryEntity] {
    
    //As we know that container is set up in the AppDelegates so we need to refer that container.
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [TopCategoryEntity]() }
    
    //We need to create a context from this container
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<TopCategoryEntity>(entityName: "TopCategoryEntity")
    
    //let key1 = NSPredicate(format: "title = %d", title)
    //let key2 = NSPredicate(format: "id = %@", id)
    
    //let andPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [key1, key2])
    //fetchRequest.predicate = andPredicate
    
    var results: [TopCategoryEntity] = []
    
    do {
        results = try managedContext.fetch(fetchRequest)
    }
    catch {
        print("error executing fetch request: \(error)")
    }
    
    return results
    
}

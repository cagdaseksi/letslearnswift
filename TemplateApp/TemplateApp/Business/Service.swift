//
//  Service.swift
//  TemplateApp
//
//  Created by MAC on 17.10.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

var model = Root()
var baseUrl = "http://api.bankomaclar.com/api/v1"

func getTopCategory(view:UIView, tableView:UITableView) {
    
    model.topCategory = []
    
    let url = "\(baseUrl)/topcategory"
    
    let container: UIView = UIView()
    container.frame = view.frame
    container.center = view.center
    container.backgroundColor = UIColor(white: 0x444444, alpha: 0.3)
    
    let loadingView: UIView = UIView()
    loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
    loadingView.center = view.center
    loadingView.backgroundColor = UIColor(white: 0x444444, alpha: 0.7)
    loadingView.clipsToBounds = true
    loadingView.layer.cornerRadius = 10
    
    // Create the Activity Indicator
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
    activityIndicator.style = .whiteLarge
    // Add it to the view where you want it to appear
    loadingView.addSubview(activityIndicator)
    container.addSubview(loadingView)
    view.addSubview(container)
    
    // Start the loading animation
    activityIndicator.startAnimating()
    
    //deleteCoreAllData()
    
    let topCategories = getAll_TopCategories()
    
    if topCategories.count > 0 {
        for value in topCategories  {
            
            let id = value.id
            let text = value.title ?? ""
            let shortDescription = value.shortdescription ?? ""
            let description = value.descriptionlong ?? ""
            let url = value.url ?? ""
            let icon = value.icon
            
            model.topCategory.append(Entity(name: text, id: Int(id), shortDescription: shortDescription, description: description, url: url, icon: icon))
            
        }
        
        print("core data top category")
        
        activityIndicator.removeFromSuperview()
        container.removeFromSuperview()
        loadingView.removeFromSuperview()
        tableView.reloadData()
        
        return
        
    }
    
    let parameters: [String: Any] =
        [
            "":""
    ]

    AF.request("http://myserver.com", method: .get, encoding: JSONEncoding.default).responseDecodable(of: Entity.self) { (response) in
      guard let films = response.value else { return }
      print(films.all[0].title)
    }
    
    AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
        .responseJSON { response in
            //print(response)
            //to get status code
            
            if let status = response.response?.statusCode {
                switch(status){
                case 201:
                    print("example success")
                default:
                    print("error with response status: \(status)")
                }
            }
            //to get JSON return value
            if let data = response.result {

                let json = JSON(data)
                
                let status = json["Status"].boolValue
                let message = json["Message"].stringValue
                
                if status == false{
                    
                    print(message)
                    //self.defaultAlert(message: message)
                    //Utility.app.showStatus(status: message, style: .danger, vc: TopCategoryVC)
                    return
                }
                
                for (key, value) in json["Entity"]  {
                    
                    let id = value["Id"].intValue
                    let text = value["Title"].stringValue
                    let shortDescription = value["ShortDescription"].stringValue
                    let description = value["Description"].stringValue
                    let url = value["Icon"].stringValue
                    
                    model.topCategory.append(Entity(name: text, id: id, shortDescription: shortDescription, description: description, url: url, icon: nil))

                    // core data
                    create_TopCategory(item: Entity(name: text, id: id, shortDescription: shortDescription, description: description, url: url, icon: nil), entityName: "TopCategoryEntity")
                    
                }
                
                activityIndicator.removeFromSuperview()
                container.removeFromSuperview()
                loadingView.removeFromSuperview()
                tableView.reloadData()
            }
    }
    
}




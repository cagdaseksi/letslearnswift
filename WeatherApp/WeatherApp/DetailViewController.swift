//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by MAC on 14.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var city = ""
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblWeather: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        
        lblCityName.text = city
        getTodayResult(cityName: city)
        
    }
    
    func getTodayResult(cityName: String){
           
           if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=0f6112b1d663b03202ffabe9788c51ef"){
           
            let request = URLRequest(url: url)
           
           let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
               
               if error == nil{
                   
                   if let incommingData = data {
                       
                       do{
                           let jsonResult =  try JSONSerialization.jsonObject(with: incommingData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject

                            if let main = jsonResult["main"] as? NSDictionary{
                               // print("Seçtiğin şehrin hava durum bilgisi : \(description)")
                                
                                   if let temp = main["temp"] as? Double {
                                   
                                   let state = (Int)(temp - 273.15)
                                   
                                   print(state)
                                   
                                   DispatchQueue.main.sync(execute: {
                                        self.lblWeather.text = String (state)
                                   })
                               }
                           }
                        
                       }catch{
                           print("Hata oluştu")
                       }

                       
                       
                   }
               }
               
           
           }
               task.resume()
           }
           
           
           
       }

}

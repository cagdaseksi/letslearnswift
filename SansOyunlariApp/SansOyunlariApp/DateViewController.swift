//
//  DateViewController.swift
//  SansOyunlariApp
//
//  Created by MAC on 1.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class DateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dates = [Date]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getDates()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dates[indexPath.row].date
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ResultViewController
        guard let row = tableView.indexPathForSelectedRow?.row else {return}
        let date = dates[row]
        vc.date = date
    }
    
    func getDates() {
        
        dates = []
        
        let url = URL(string: "http://www.millipiyango.gov.tr/sonuclar/listCekilisleriTarihleri.php?tur=onnumara")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("error: \(error)")
            }else {
                
                if let response = response as? HTTPURLResponse {
                    print("status code: \(response.statusCode)")
                }
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                        
                        //print(json)
                        
                        for dic in json {
                            
                            self.dates.append(Date(dic))
                            
                        }
                        
                        self.dates = Array(self.dates)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                        
                    }
                    
                }
                catch let error as NSError {
                    print("error: \(error.localizedDescription)")
                }
                
            }
            
            
        }
        task.resume()
        
    }
}



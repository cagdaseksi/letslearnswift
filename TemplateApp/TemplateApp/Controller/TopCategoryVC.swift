//
//  TopCategoryVC.swift
//  TemplateApp
//
//  Created by MAC on 17.10.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//


import UIKit
import AVFoundation

var main = Main()

class TopCategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.tableview.backgroundColor = UIColor(red: 62, green: 124, blue: 75, alpha: 0)
        
        let utterance1 = AVSpeechUtterance(string: "Merhaba, Çeviriyle öğren uygulamasına Hoşgeldiniz. İngilizce öğrenmek için, gerçekten doğru bir karar verdiğini söyleyebilirim. Tek yapmamız gereken, bol bol pratik yapmak. Unutma, ünitelerdeki örnekleri yazarak, çözmen ingilizce seviyeni oldukça geliştirmeye, yardımcı olacaktır.")
        utterance1.voice = AVSpeechSynthesisVoice(language: "tr-TR")
        utterance1.rate = 0.5
        
        let synthesizer1 = AVSpeechSynthesizer()
        //synthesizer1.speak(utterance1)
        
        tableview.delegate = self
        tableview.dataSource = self
        print(model.topCategory)
        getTopCategory(view: self.view, tableView: self.tableview)
        
        // Do any additional setup after loading the view.
        DispatchQueue.global(qos: .userInteractive).async {
           
            DispatchQueue.main.async {
               // self.tableview.reloadData()
            }
        }
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 600
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.topCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TopCategoryTableViewCell
        //print(model.topCategory[indexPath.row].name)
        cell.lblTitle.text = model.topCategory[indexPath.row].name
        cell.lblDescription.text = model.topCategory[indexPath.row].shortDescription
        
        cell.btnDownload.tag = indexPath.row
        cell.btnDownload.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)
        
        let link = model.topCategory[indexPath.row].url
        
        if model.topCategory[indexPath.row].icon != nil {
            cell.img.contentMode = .scaleAspectFit
            cell.img.image = UIImage(data: model.topCategory[indexPath.row].icon!)
        }else {
            cell.img.downloaded(from: link)
        }
        
        //cell.img.downloaded(from: link)
        
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        main = Main()
        let chosenRow = model.topCategory[indexPath.row]
        performSegue(withIdentifier: "toCategory", sender: chosenRow)
    }
    
    @objc func subscribeTapped(_ sender: UIButton){
        print("downloaded.")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCategory" {
            if let vc = segue.destination as? CategoryVC {
                let en = sender as! Entity
                vc.topCategoryId = en.id
                main.topCategoryId = en.id
                vc.topCategoryTitle = en.name
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

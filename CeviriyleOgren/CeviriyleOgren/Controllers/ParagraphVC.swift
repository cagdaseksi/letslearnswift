//
//  ParagraphVC.swift
//  CeviriyleOgren
//
//  Created by MAC on 19.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class ParagraphVC: UIViewController, UITableViewDataSource, UITableViewDelegate, AVSpeechSynthesizerDelegate {

    var items = [CategoryModel]()
    var category = ""
    var book = ""
    var chapter = ""
    var selectedIndexpath:IndexPath!
    @IBOutlet weak var tableView: UITableView!
    let synthesizer = AVSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveItems(category: category, book: book, chapter: chapter)
        // Do any additional setup after loading the view.

        synthesizer.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ParagraphTableViewCell
        
        let row = self.items[indexPath.row]
        
        cell.lblParagraf.text = row.en
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        let row = self.items[indexPath.row]
        
        let status = row.status ? false : true
        
        self.items[indexPath.row].status = status
        
        tableView.beginUpdates()
        let myIndexPath = NSIndexPath(row: indexPath.row, section: 0)
        let cell = tableView.cellForRow(at: myIndexPath as IndexPath) as! ParagraphTableViewCell
        
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        UITableViewCell.transition(with: cell, duration: 1.0, options: transitionOptions, animations: {
            cell.lblParagraf.text = status ? row.tr : row.en
            //tableView.reloadRows(at: [indexPath], with: .top)
        })
        tableView.endUpdates()
     }
     
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let listen = UIContextualAction(style: .normal, title: "Dinle", handler: { _, _, completionHandler in
            print("more \(indexPath)")
            
            self.selectedIndexpath = indexPath
            
            let row = self.items[indexPath.row]

            let str = row.status ? row.tr : row.en
            
            let utterance = AVSpeechUtterance(string: str)
            utterance.voice = AVSpeechSynthesisVoice(language: row.status ? "tr-TR" : "en-GB")
            //utterance.rate = Float(0.5)
            self.synthesizer.speak(utterance)
            
            completionHandler(true)
        })

        listen.backgroundColor = .lightGray
        
        return UISwipeActionsConfiguration(actions: [listen])
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        let mutableAttributedString = NSMutableAttributedString(string: utterance.speechString)
        mutableAttributedString.addAttribute(.foregroundColor, value: UIColor.red, range: characterRange)
        print(selectedIndexpath)
        if selectedIndexpath != nil {
            tableView.beginUpdates()
            let myIndexPath = NSIndexPath(row: selectedIndexpath.row, section: 0)
            let cell = tableView.cellForRow(at: myIndexPath as IndexPath) as! ParagraphTableViewCell
            cell.lblParagraf.attributedText = mutableAttributedString
            tableView.endUpdates()
        }
        
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        if selectedIndexpath != nil {
            tableView.beginUpdates()
            let myIndexPath = NSIndexPath(row: selectedIndexpath.row, section: 0)
            let cell = tableView.cellForRow(at: myIndexPath as IndexPath) as! ParagraphTableViewCell
            cell.lblParagraf.attributedText = NSAttributedString(string: utterance.speechString)
            tableView.endUpdates()
        }
    }
    
    func retrieveItems(category: String, book: String, chapter: String) {
    
        DataService.dataService.CATEGORY_REF.child(category).child(book).child(chapter).observe(.value, with: { (snapshot: DataSnapshot?) in
            
            if let snapshots = snapshot?.children.allObjects as? [DataSnapshot] {
                self.items.removeAll()
                print(snapshots.count)
                for snap in snapshots {
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let itemModel = CategoryModel(key: snap.key, dictionary: postDictionary)
                        self.items.append(itemModel)
                    }
                }
            }
            
            self.tableView.reloadData()
        })
    }

}

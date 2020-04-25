//
//  UploadVC.swift
//  FirebaseApp
//
//  Created by MAC on 16.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit
import Firebase

class UploadVC: UIViewController {

    @IBOutlet weak var category: UISegmentedControl!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDesc: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func category(_ sender: Any) {
        
        movies()
        
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        let title = txtTitle.text ?? ""
        let desc = txtDesc.text ?? ""
        let cat = category.titleForSegment(at: category.selectedSegmentIndex) ?? ""
        
        let currentUser = Auth.auth().currentUser
        
        if currentUser == nil {
            Common.showAlert(with: "Please Login", vc: self)
            
            return
        }
        
        let newItem: Dictionary<String, Any> = [
           "title": title,
           "desc": desc,
           "type": cat,
           "email": currentUser?.email
        ]
        self.createNewItem(item: newItem)
        
    }
    
    func createNewItem(item: Dictionary<String, Any>) {
        let firebaseNewItem = DataService.dataService.ITEM_REF.childByAutoId()
        
        firebaseNewItem.setValue(item) { (error: Error?, ref: DatabaseReference)  -> Void in
            if error == nil {
                self.tabBarController?.selectedIndex = 0
                
                self.txtTitle.text = ""
                self.txtDesc.text = ""
                
            } else {
                Common.showAlert(with: (error?.localizedDescription)!, vc: self)
            }
        }
    }
    

    func createNewCategory(item: Dictionary<String, Any>) {
        
        let firebaseNewItem = DataService.dataService.CATEGORY_REF.childByAutoId()
        
        firebaseNewItem.setValue(item) { (error: Error?, ref: DatabaseReference)  -> Void in
            if error == nil {
                print("ok")
            } else {
                Common.showAlert(with: (error?.localizedDescription)!, vc: self)
            }
        }
        
        
    }
    
    func movies() {
        
        //let ref = Database.database().reference(withPath: "movies")
        
        let rootRef = Database.database().reference()
        let ref = rootRef.child("categories")
        
        
        let state1 = ref.child("state3")
        let state2 = ref.child("state4")
        
        let dictState1: [String: String] = ["title": "State 3", "shortDescription": "ingilizce türkçe"]
        let dictState2: [String: String] = ["title": "State 4", "shortDescription": "ingilizce türkçe"]
        
        // Saving the values in movie1 node
        state1.setValue(dictState1) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
          
        // Saving the values in pizza node
        state2.setValue(dictState2) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
        
        return
        
        // book
        
        let book1 = state1.child("book1")
        let book2 = state1.child("book2")
        
        let dictbook1: [String: String] = ["title": "Peter Pan", "shortDescription": "peter pan macerada"]
        let dictbook2: [String: String] = ["title": "Robin HOOD", "shortDescription": "fuck fakir"]
        
        book1.setValue(dictbook1) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
        
        book2.setValue(dictbook2) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
        
        
        // chapter
        
        let chapter1 = book1.child("chapter1")
        let chapter2 = book1.child("chapter2")
        
        let dictchapter1: [String: String] = ["title": "Chapter 1", "shortDescription": "en kolay bölüm"]
        let dictchapter2: [String: String] = ["title": "Chapter 2", "shortDescription": "işler kızışıyor."]
        
        chapter1.setValue(dictchapter1) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
        
        chapter2.setValue(dictchapter2) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
        
        // paragraf
        
        let p1 = chapter1.child("p1")
        let p2 = chapter1.child("p2")
        let p3 = chapter1.child("p3")
        
        let dictp1: [String: String] = ["tr": "Neden buraya oynamaya gelirsiniz? Gölgeli ağaçlar, dallarda şarkı söyleyen kuşlar sadece köşeyi dönünce ve güneş ışığı patikayı bürüyor. Kim bilir ama, dışarıda, topunuz gökyüzüne dokunabilir mi? Burada sadece beni rahatsız edeceksiniz ve belki de gülleri mahvedeceksiniz ve yapabileceğinizin en iyisi tavana vurmak!", "en": "Why do you come to play here at all? Only just round the corner are the shady trees, and the birds singing on the branches, and the sunshine is flecking the pathway. Who knows but what, out there, your ball might touch the sky? Here you will only disturb me, and perhaps spoil the roses; and at best you can but hit the ceiling!"]
        let dictp2: [String: String] = ["tr": "Kurt, büyükannenin evine koştu ve büyükanneyi yedi. Büyükannenin yatağına girdi. Biraz sonra, Küçük Kırmızı Başlıklı Kız eve ulaştı. Kurda baktı.", "en": "The wolf ran to Granny’s house and ate Granny up. He got into Granny’s bed. A little later, Little Red Riding Hood reached the house. She looked at the wolf."]
        let dictp3: [String: String] = ["tr": "Tina 6 yaşında sevimli bir kızdı. Tahta oyuncaklara çok düşkündü, özellikle 2 yaşındayken amcası tarafından hediye edilen güzel bir tahta atı vardı. Tahta at, onun yakın arkadaşı ve evcil hayvanı olmuştu. 9 yaşında bir abisi vardı. Ailesiyle birlikte ormanda bir doğa tesisine tatile gitti. Tahta atı yanında taşıdı. Tatilinde ailesiyle birlikte ormanda eğlendi. Eve dönmeyi planladıkları üzere kardeşi ile eşyaları toplarken tahtadan at düşmüştü ve bacaklarından biri kırılmıştı. Tina çok üzüldü ve sessizce atı için ağladı.", "en": "Tina was a 6 years old cute girl. She is very fond of wooden toys, especially she had a beautiful wood horse gifted by her uncle when she was 2 years old. The wooden horse has been her close pal and her pet. She has a 9 years old brother. She went on a vacation to a nature resort in the woods with her family. She carried the wooden horse with her. She enjoyed her holiday with her family in the woods. While she was packing things with her brother as they planned to return home, the wooden horse fallen down and one of the legs were broken. Tina was too sad and silently cried for her horse. She was very upset. They packed all things and left the woods. Entire family tried to cheer up the sweet little girl, but Tina was so silent, very upset. Tina’s brother tried to console her a lot."]
        
        p1.setValue(dictp1) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
        
        p2.setValue(dictp2) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
        
        p3.setValue(dictp3) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
        
    }
    
    
}

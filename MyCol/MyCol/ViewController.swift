//
//  ViewController.swift
//  MyCol
//
//  Created by MAC on 15.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 100
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell

        cell.backgroundColor = self.randomColor()
        cell.lbl.text = "\(indexPath.row + 1)"

        return cell

    }
       
    func randomColor() -> UIColor{
       let red = CGFloat(drand48())
       let green = CGFloat(drand48())
       let blue = CGFloat(drand48())
       return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
   

}


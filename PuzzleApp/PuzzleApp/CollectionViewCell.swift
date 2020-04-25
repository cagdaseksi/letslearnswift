//
//  CollectionViewCell.swift
//  PuzzleApp
//
//  Created by MAC on 25.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var puzzleImage: UIImageView!
    
    override func awakeFromNib() {
        self.frame = puzzleImage.frame
    }
    
}

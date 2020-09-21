//
//  Halper.swift
//  AwesomeApp
//
//  Created by MAC on 21.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? UIKit.Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

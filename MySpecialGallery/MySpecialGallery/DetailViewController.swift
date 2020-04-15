//
//  DetailViewController.swift
//  MySpecialGallery
//
//  Created by MAC on 15.04.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var detailTitle: UITextField!
    @IBOutlet weak var detailShort: UITextField!
    @IBOutlet weak var detailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSelect(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        let title = detailTitle.text ?? ""
        let shortDescription = detailShort.text ?? ""
        
        if let imageData = detailImage.image?.jpegData(compressionQuality: 1) {
            DataBaseHelper.shareInstance.save(title: title, shortdescription: shortDescription, image: imageData)
        }
        
       // previous controller
        _ = navigationController?.popViewController(animated: true)
        
        //root controller
        //_ = navigationController?.popToRootViewController(animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return }
        detailImage.image = userPickedImage

        picker.dismiss(animated: true)
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

//
//  ProfileViewController.swift
//  StockRun
//
//  Created by Michael Rojas on 4/22/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let image = DataSource.shared.getProfileImage()
        if let image = image {
            profileImage.image = image
        }
        if let stocks = DataSource.shared.getUserStocks() {
            scoreLabel.text = String(stocks.count)
        }
    }
    @IBAction func photoButtonPressed(_ sender: Any) {
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func takePictureButtonPressed(_ sender: Any) {
        // Crasheybois
        if UIImagePickerController.isCameraDeviceAvailable(.front) {
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImage.image = pickedImage
            DataSource.shared.saveImage(image: pickedImage)
        }
        dismiss(animated: true, completion: nil)
    }
}

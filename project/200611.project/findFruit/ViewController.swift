//
//  ViewController.swift
//  findFruit
//
//  Created by 이진욱 on 2020/06/10.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {
  @IBOutlet weak var fruitImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var percentLabel: UILabel!
  
  var picker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    picker.delegate = self
  }
  
  @IBAction func showCamera(_ sender: Any) {
    picker.sourceType = .camera
    self.present(picker, animated: true, completion: nil)
  }
  
  @IBAction func openPhotoLibrary(_ sender: Any) {
    picker.sourceType = .photoLibrary
    self.present(picker, animated: true, completion: nil)
  }
  
  func processImage(_ image: UIImage) {
    // ML Model
    if let model = try? VNCoreMLModel(for: fruitClassifier().model) {
      let request = VNCoreMLRequest(model: model) { (request, error) in
        if let results = request.results as? [VNClassificationObservation] {
          let firstValue = results.sorted { (lh, rh) -> Bool in
            return lh.confidence > rh.confidence
          }.first
          if let bestMatch = firstValue {
            self.nameLabel.text = bestMatch.identifier
            self.percentLabel.text = "\(bestMatch.confidence * 100) %"
          }
        }
      }
      // image Data
      if let imageData = image.jpegData(compressionQuality: 0.7) {
        let handler = VNImageRequestHandler(data: imageData, options: [:])
        try? handler.perform([request])
      }
    } else {
      
    }
    // Find
  }
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[.originalImage] as? UIImage {
      self.fruitImageView.image = image
      processImage(image)
    }
    picker.dismiss(animated: true, completion: nil)
  }
}

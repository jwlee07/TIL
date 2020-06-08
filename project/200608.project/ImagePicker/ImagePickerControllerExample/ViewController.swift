//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2020. 6. 1..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MobileCoreServices
import UIKit

final class ViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  
  private let imagePicker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePicker.delegate = self
  }
  
  
  @IBAction private func pickImage(_ sender: Any) {
    print("\n---------- [ pickImage ] ----------\n")
    imagePicker.sourceType = .photoLibrary
    present(imagePicker, animated: true)
  }
  
  
  @IBAction private func takePicture(_ sender: Any) {
    print("\n---------- [ takePicture ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return}
    imagePicker.sourceType = .camera
    let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
    imagePicker.mediaTypes = mediaTypes ?? []
    imagePicker.mediaTypes = [kUTTypeImage, kUTTypeMovie] as [String]
    present(imagePicker, animated: true)
    
  }
  
  @IBAction private func takePictureWithDelay(_ sender: Any) {
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return}
    imagePicker.sourceType = .camera
    imagePicker.mediaTypes = [kUTTypeImage as String]
    present(imagePicker,animated: true) {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        self.imagePicker.takePicture()
      }
    }
    print("\n---------- [ takePictureWithDelay ] ----------\n")
  }
  
  
  @IBAction private func recordingVideo(_ sender: Any) {
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return}
    imagePicker.sourceType = .camera
    imagePicker.mediaTypes = [kUTTypeMovie as String]
    imagePicker.cameraCaptureMode = .video // 처음 나타날 때 이것으로 나타남
    imagePicker.cameraDevice = .rear //  카메라 전면/ 후면 선택
    
    // Movie : 영상 + 소리
    // Video : 영상
    print("\n---------- [ recordingVideo ] ----------\n")
  }

  @IBAction private func toggleAllowsEditing(_ sender: Any) {
    imagePicker.allowsEditing.toggle()
    print("\n---------- [ toggleAllowsEditing ] ----------\n")
  }
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  // 사진 누르는 순간 호출
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let mediaType = info[.mediaType] as! NSString
    if UTTypeEqual(mediaType, kUTTypeImage) {
      let orginImage = info[.originalImage] as! UIImage
      let editedImage = info[.editedImage] as? UIImage
      let selectImage = editedImage ?? orginImage
      imageView.image = selectImage
      if picker.sourceType == .camera {
        UIImageWriteToSavedPhotosAlbum(selectImage, nil, nil, nil)
      }
    } else if UTTypeEqual(mediaType, kUTTypeMovie) {
      if let mediaPath = (info[.mediaURL] as? NSURL)?.path, UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
        UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
      }
    }
    picker.dismiss(animated: true)
  }
  // 취소 눌렀을 떄 호출 (cnacel 메서드에서 할 작업이 없으면 생략)
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true)
    print ("imagePickerControllerDidCancel")
  }
  

}

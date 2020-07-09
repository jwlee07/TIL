//
//  ViewController.swift
//  SPMExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import Kingfisher


// 치트시트
// https://github.com/onevcat/Kingfisher/wiki/Cheat-Sheet

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView! {
    didSet {
//      withoutKingFisher()
    }
  }

  let url = URL(string: "https://picsum.photos/1024")!
  var randomImage: UIImage {
    ["cat"].compactMap(UIImage.init(named:)).randomElement()!
  }
  
  func withoutKingFisher() {
    URLSession.shared.dataTask(with: url) { data, response, error in
      if error != nil { return print (error!.localizedDescription)}
      if let data = data {
        DispatchQueue.main.async {
          self.imageView.image = UIImage(data: data)
        }
      }
    }.resume()
  }
  
  
  // MARK: Action
  
  @IBAction private func setImageBasic(_ sender: Any) {
    
//    imageView.kf.indicatorType = .activity
//    imageView.kf.setImage(with: url, options: [.forceRefresh])
    
//    let gifUrl = Bundle.main.url(forResource: "mina", withExtension: "gif")!
//    let imageeData = try! Data(contentsOf: gifUrl)
//    imageView.kf.indicatorType = .image(imageData: imageeData)
//    imageView.kf.setImage(with: url, placeholder: randomImage, options: [.forceRefresh])
  }
  
  
  @IBAction private func imageOptions(_ sender: Any) {
    imageView.kf.setImage(
      with: url,
      options: [.onFailureImage(randomImage), .forceRefresh])
    imageView.kf.cancelDownloadTask()
  }
  
  
  @IBAction private func parameters(_ sender: Any) {
    imageView.kf.setImage(
      with: url,
      options: [.forceRefresh],
      progressBlock: { receivedSize, totalSize in
        // 서버 응답 헤더에 "Content-Length"가 있는 경우만 호출
        let percentage = (Float(receivedSize)) / (Float(totalSize)) * 100.0
        print ("downloading progress : \(percentage)")
    }) { result in
      switch result {
      case .success(let value):
        print (value.image) // 이미지 객체
        print (value.cacheType) // 캐싱 여부
        print (value.source) // 출처
      case .failure(let error):
        print(error)
      }
    }
  }
  
  
  @IBAction private func imageProcessor(_ sender: Any) {
    
    var multipleProcessor: ImageProcessor =
      // 이미지 뷰 크기에 맞게 이미지를 다운샘플링
      DownsamplingImageProcessor(size: imageView.frame.size)
    
    let imageProcessors: [ImageProcessor] = [
      CroppingImageProcessor(size: CGSize(width: 640, height: 640)),
      BlurImageProcessor(blurRadius: 2),
      BlackWhiteProcessor(),
      RoundCornerImageProcessor(cornerRadius: 50)
    ]
    
    for processor in imageProcessors {
      multipleProcessor = multipleProcessor |> processor
    }
    
//    let processorChain = BlurImageProcessor(blurRadius: 4) |> RoundCornerImageProcessor(cornerRadius: 80)
    
    imageView.kf.setImage(
      with: url,
      options: [.forceRefresh, .processor(multipleProcessor)])
    
  }
}

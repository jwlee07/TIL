//
//  ImageAnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 6. 4..
//  Copyright © 2020년 giftbot. All rights reserved.

import UIKit

final class ImageAnimationViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView! {
    didSet {
      imageView.animationImages = images
    }
  }
  @IBOutlet private weak var durationLabel: UILabel!
  @IBOutlet private weak var repeatCountLabel: UILabel!
  
  let images = [
    "AppStore", "Calculator", "Calendar", "Camera", "Clock", "Contacts", "Files"
    ].compactMap(UIImage.init(named:))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
      
  }
  
  @IBAction private func startAnimation(_ sender: Any) {
    imageView.startAnimating()
  }
  
  @IBAction private func stopAnimation(_ sender: Any) {
    guard imageView.isAnimating else {return}
    imageView.stopAnimating()
  }
  
  @IBAction private func durationStepper(_ sender: UIStepper) {
    durationLabel.text = "\(sender.value)"
    imageView.animationDuration = sender.value
    
    // 1 Cycle Duration
    // Default : 0.0 : 1/30 Second
    
  }
  
  @IBAction private func repeatCountStepper(_ sender: UIStepper) {
    let repleatCount = Int(sender.value)
    repeatCountLabel.text = "\(sender.value)"
    // 반복 횟수
    // 기본 값 : 0 (무한 반복)
    imageView.animationRepeatCount = repleatCount
  }
}

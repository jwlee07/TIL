//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView! {
    didSet {
      imageView.layer.cornerRadius = imageView.frame.width / 2
      imageView.clipsToBounds = true
    }
  }
  // MARK: Tap
  
  var isToggle = false
  
  
  // touchs : 손가락 갯수
  // tap : 누른 갯수
  
  // 더블 탭 하면 이미지 원본의 크기가 4배 증가
  @IBAction private func handleTapGesture(_ sender: UITapGestureRecognizer) {
    guard sender.state == .ended else { return }
    
    if !isToggle {
      UIView.animate(withDuration: 0.5) {
        self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
      }
    } else {
      UIView.animate(withDuration: 0.5) {
        self.imageView.transform = .identity
      }
    }
    isToggle.toggle()
  }
  
  
  
  // MARK: Rotation
  
  @IBAction private func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
    guard sender.state == .began || sender.state == .changed else { return }
    imageView.transform = imageView.transform.rotated(by: sender.rotation)
    sender.rotation = 0
  }
  
  
  // MARK: Swipe
  
  @IBAction private func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
    guard sender.state == .ended else { return }
    if sender.direction == .left {
      imageView.image = UIImage(named: "cat1")
      sender.direction = .right
    } else {
      imageView.image = UIImage(named: "cat2")
      sender.direction = .left
    }
  }
}

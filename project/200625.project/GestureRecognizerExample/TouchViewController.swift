//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView! {
    didSet {
      imageView.layer.cornerRadius = imageView.bounds.width / 2
      imageView.clipsToBounds = true
    }
  }
  
  var isHoldingImage = false
  var lastTouchPoint = CGPoint.zero
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    let imagePoint = imageView.frame
    if (touchPoint.y < imagePoint.maxY && touchPoint.y > imagePoint.minY),
      (touchPoint.x < imagePoint.maxX && touchPoint.x > imagePoint.minX) {
      imageView.image = UIImage(named: "cat2")
      isHoldingImage = true
      lastTouchPoint = touchPoint
    }
    print ("touchesBegan touchPoint", touchPoint)
    print ("touchesBegan lastTouchPoint", lastTouchPoint )
  }
  
  // MARK: - Touch
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    let imagePoint = imageView.frame
    if (touchPoint.y < imagePoint.maxY && touchPoint.y > imagePoint.minY),
      (touchPoint.x < imagePoint.maxX && touchPoint.x > imagePoint.minX),
      isHoldingImage {
//      imageView.center.x = touchPoint.x
//      imageView.center.y = touchPoint.y
      
      // currentTouchPoint = 100 (움직인 위치)
      // lastTouchPoint = 150 (시작 위치)
      // 100 - 150 = -50 (이동거리)
      
      imageView.center.x = imageView.center.x + (touchPoint.x - lastTouchPoint.x)
      imageView.center.y = imageView.center.y + (touchPoint.y - lastTouchPoint.y)
      lastTouchPoint = touchPoint
    }
    print ("touchesMoved touchPoint", touchPoint)
    print ("touchesMoved lastTouchPoint", lastTouchPoint )
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    imageView.image = UIImage(named: "cat1")
  }
  
  // 시스템 인터럽션 상태, 다른 화면으로 전활 될 때
  
  // MARK: - Motion
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    guard isHoldingImage else { return }
  }
  
  override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      imageView.image = UIImage(named: "cat2")
    }
  }
  override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      imageView.image = UIImage(named: "cat1")
    }
  }
}




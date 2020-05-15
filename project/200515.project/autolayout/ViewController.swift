//
//  ViewController.swift
//  autolayout
//
//  Created by 이진욱 on 2020/05/15.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let redView = UIView()
  let blueVIew = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    redView.backgroundColor = .systemRed
    view.addSubview(redView)
    
    blueVIew.backgroundColor = .systemBlue
    view.addSubview(blueVIew)
  }
  override func viewWillLayoutSubviews() {
    
    let margin : CGFloat = 20
    let padding : CGFloat = 10
    let safeLayoutInsets = view.safeAreaInsets
    let horizontalInset = safeLayoutInsets.left + safeLayoutInsets.right
    
    let yOffset = safeLayoutInsets.top + margin
    let viewWidth = (view.frame.width - padding - horizontalInset) / 2 - margin

    redView.frame = CGRect (
      x: safeLayoutInsets.left + margin,
      y: yOffset,
      width: viewWidth,
      height: view.frame.height - yOffset - (safeLayoutInsets.bottom + margin))
    
    blueVIew.frame = CGRect (
      x: redView.frame.maxX + 10,
      y: yOffset,
      width: viewWidth,
      height: view.frame.height - yOffset - (safeLayoutInsets.bottom + margin))
  }
}


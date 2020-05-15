//
//  ViewController.swift
//  autolayoutPractice
//
//  Created by 이진욱 on 2020/05/15.
//  Copyright © 2020 jwlee. All rights reserved.
//
// View와 SafeArea를 구분해 오토레이아웃 설정하기
//
// - 5개의 뷰를 생성하고 높이는 150으로 통일
// - Safe Area Top 과 60 의 거리
// - 가장 왼쪽의 뷰는 leading 20, 가장 오른쪽의 뷰는 trailing 20으로 설정하고 각 view 간의 거리는 8로 고정
// - 각 위치에서 오른쪽에 있는 뷰는 왼쪽 뷰 width 의 0.7배에서 해당 위치의 인덱스만큼 뺀 값을 width 값으로 지님
//
// 예시)
// 2번째 뷰의 width는 1번째 뷰 width의 0.7배보다 1 작게 설정
// 3번째 뷰의 width는 2번째 뷰 width의 0.7배보다 2 작게 설정

import UIKit

class ViewController: UIViewController {
  let firstView = UIView()
  let secondView = UIView()
  let thirdView = UIView()
  let fourView = UIView()
  let fiveView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    firstView.backgroundColor = .systemBlue
    secondView.backgroundColor = .systemBlue
    thirdView.backgroundColor = .systemBlue
    fourView.backgroundColor = .systemBlue
    fiveView.backgroundColor = .systemBlue
    
    view.addSubview(firstView)
    view.addSubview(secondView)
    view.addSubview(thirdView)
    view.addSubview(fourView)
    view.addSubview(fiveView)
  }
  override func viewWillLayoutSubviews() {
    
    
    
    let margin: CGFloat = 20
    let padding: CGFloat = 8
    let plusSize: CGFloat = 0.7
    let heightSize: CGFloat = 150
    
    let horizen = view.safeAreaInsets.left + view.safeAreaInsets.right
    
    let xOffset = view.safeAreaInsets.left + margin
    let yOffset = view.safeAreaInsets.top + 60
    let widthSize = (view.frame.width - padding - horizen) / 3 - margin
    
    print ("view.safeAreaInsets : ", view.safeAreaInsets)
    
    print ("view.safeAreaInsets.left : ", view.safeAreaInsets.left)
    print ("view.safeAreaInsets.right : ", view.safeAreaInsets.right)
    
    firstView.frame = CGRect (
      x: xOffset,
      y: yOffset,
      width: widthSize,
      height: heightSize)
    
    secondView.frame = CGRect (
      origin: CGPoint(x: firstView.frame.maxX + padding, y: yOffset),
      size: CGSize(width: (firstView.frame.width * plusSize) - 1, height: heightSize))
    
    thirdView.frame = CGRect (
      origin: CGPoint(x: secondView.frame.maxX + padding, y: yOffset),
      size: CGSize(width: (secondView.frame.width * plusSize) - 1, height: heightSize))
    
    fourView.frame = CGRect (
      origin: CGPoint(x: thirdView.frame.maxX + padding, y: yOffset),
      size: CGSize(width: (thirdView.frame.width * plusSize) - 1 , height: heightSize))
    
    fiveView.frame = CGRect (
      origin: CGPoint(x: fourView.frame.maxX + padding, y: yOffset),
      size: CGSize(width: (fourView.frame.width * plusSize) - 1, height: heightSize))
    }
  
}


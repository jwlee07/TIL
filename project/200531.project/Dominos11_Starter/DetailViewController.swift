//
//  DetailViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  let detailImageView = UIImageView()
  let detailContainerView = UIView()
  
  let detailPlusButton = UIButton()
  let detailMinusButton = UIButton()
  var detailCountLabel = UILabel()
  
  let wishVC = WishListViewController()
  
  var countLable = 0 {
    didSet {
      detailCountLabel.text = String(countLable)
    }
  }
  
  let margin: CGFloat = 50
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupDetailImageView()
    settupDetaulContainerView()
    settupDetailButton()
    setupDetailLabel()
  }
  func setupDetailImageView() {
    detailImageView.frame = CGRect (
      x: view.safeAreaInsets.left,
      y: view.center.y / 3,
      width: view.frame.width,
      height: view.frame.height/2)
    view.addSubview(detailImageView)
  }
  func settupDetaulContainerView() {
    detailContainerView.frame = CGRect (
      x: view.safeAreaInsets.left + margin,
      y: detailImageView.frame.maxY + (margin * 2),
      width: view.frame.width - (margin * 2),
      height: 50)
    view.addSubview(detailContainerView)
  }
  func settupDetailButton() {
    detailPlusButton.frame = CGRect (
      x: detailContainerView.safeAreaInsets.left,
      y: detailContainerView.safeAreaInsets.top,
      width: detailContainerView.frame.width/3,
      height: detailContainerView.frame.height)
    detailPlusButton.tag = 0
    detailPlusButton.setImage(UIImage(systemName: "plus"), for: .normal)
    detailPlusButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    
    detailMinusButton.frame = CGRect (
      x: detailContainerView.frame.width - detailContainerView.frame.width/3 ,
      y: detailContainerView.safeAreaInsets.top,
      width: detailContainerView.frame.width/3,
      height: detailContainerView.frame.height)
    detailMinusButton.tag = 1
    detailMinusButton.setImage(UIImage(systemName: "minus"), for: .normal)
    detailMinusButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    
    detailContainerView.addSubview(detailPlusButton)
    detailContainerView.addSubview(detailMinusButton)
  }
  func setupDetailLabel() {
    detailCountLabel.frame = CGRect (
      x: detailContainerView.center.x - margin,
      y: detailContainerView.safeAreaInsets.top,
      width: margin,
      height: detailContainerView.frame.height)
    detailCountLabel.text = "\(countLable)"
    detailCountLabel.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    detailContainerView.addSubview(detailCountLabel)
  }
  @objc func actionButton(_ sender: UIButton) {
    switch sender.tag {
    case 0:
      wishVC.wishImageArr.insert(detailImageView.image!, at: 0)
      wishVC.wishTitleArr.insert(title!, at: 0)
      wishVC.wishCountArr.insert(countLable, at: 0)
      countLable += 1
    case 1:
      countLable -= 1
    default:
      break
    }
  }
}

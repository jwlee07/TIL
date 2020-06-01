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
  let containerView = UIView()
  var detailTitle: String = ""
  
  let plusButton = UIButton()
  let minusButton = UIButton()
  let countLabel = UILabel()
  
  let margin: CGFloat = 100
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupDetailImageView()
    setupDetailContainerView()
    setupContainerInsert()
  }
  private func setupDetailImageView() {
    detailTitle = navigationItem.title!
    detailImageView.frame = CGRect(
      x: view.safeAreaInsets.left,
      y: view.safeAreaInsets.top + margin,
      width: view.frame.width,
      height: view.frame.height/2)
    detailImageView.image = UIImage(named: detailTitle)
    view.addSubview(detailImageView)
  }
  private func setupDetailContainerView() {
    containerView.frame = CGRect(
      x: margin,
      y: view.center.y + (margin * 2),
      width: view.frame.width - (margin * 2),
      height: 50)
    view.addSubview(containerView)
  }
  private func setupContainerInsert() {
    
    let size: CGFloat = containerView.frame.height
    
    plusButton.frame = CGRect(
      x: containerView.safeAreaInsets.left,
      y: containerView.safeAreaInsets.top,
      width: size,
      height: size)
    plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
    plusButton.tag = 0
    plusButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    containerView.addSubview(plusButton)
    
    minusButton.frame = CGRect (
      x: containerView.frame.width - size,
      y: containerView.safeAreaInsets.top,
      width: size,
      height: size)
    minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
    minusButton.tag = 1
    minusButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    containerView.addSubview(minusButton)
    
    countLabel.frame = CGRect (
      x: (containerView.frame.width / 2) - (size / 2),
      y: containerView.safeAreaInsets.top,
      width: size,
      height: size)
    if DataWishListDics.keys.contains(detailTitle) {
      countLabel.text = "\(DataWishListDics[detailTitle]!)"
    } else {
      countLabel.text = "0"
    }
    countLabel.textColor = .black
    countLabel.textAlignment = .center
    containerView.addSubview(countLabel)
  }
  @objc private func actionButton(_ sender: UIButton) {
    switch sender.tag {
    case 0:
      if DataWishListDics.keys.contains(detailTitle) {
        DataWishListDics[detailTitle]! += 1
      } else {
        DataWishListDics[detailTitle] = 1
      }
      countLabel.text = "\(DataWishListDics[detailTitle]!)"
      
    case 1:
      if DataWishListDics.keys.contains(detailTitle) {
        if DataWishListDics[detailTitle]! > 0 {
          DataWishListDics[detailTitle]! -= 1
          countLabel.text = "\(DataWishListDics[detailTitle]!)"
        }
        if DataWishListDics[detailTitle]! == 0 {
          DataWishListDics.removeValue(forKey: detailTitle)
          countLabel.text = "0"
        }
      }
      
    default:
      break
    }
    
    
  }
}

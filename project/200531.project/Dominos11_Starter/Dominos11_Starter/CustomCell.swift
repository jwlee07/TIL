//
//  CustomCell.swift
//  Dominos11_Starter
//
//  Created by 이진욱 on 2020/05/29.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
  let categoryImageView = UIImageView()
  
  let categoryImageArr = [
  UIImage.init(named: "슈퍼시드"),
  UIImage.init(named: "프리미엄"),
  UIImage.init(named: "클래식"),
  UIImage.init(named: "사이드디시"),
  UIImage.init(named: "음료"),
  UIImage.init(named: "피클소스")
  ]
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCategoryImageView()
  }
  override func layoutIfNeeded() {
    super.layoutIfNeeded()
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("error")
  }
  
  func setupCategoryImage(_ sender: Int) -> UIImage {
    return categoryImageArr[sender]!
  }
  
  func setupCategoryImageView() {
    categoryImageView.frame = CGRect (
      x: 0,
      y: 0,
      width: contentView.frame.width + (contentView.frame.width / 3),
      height: 100)
    contentView.addSubview(categoryImageView)
  }
}

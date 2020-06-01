//
//  CustomCell.swift
//  Dominos11_Starter
//
//  Created by 성단빈 on 2020/06/01.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
  
  let categoryCellImageView = UIImageView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCategoryImageView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func layoutIfNeeded() {
    super.layoutIfNeeded()
  }
  func setupCategoryImageView() {
    categoryCellImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width + (contentView.frame.width/3), height: 100)
    contentView.addSubview(categoryCellImageView)
    
  }
  
}

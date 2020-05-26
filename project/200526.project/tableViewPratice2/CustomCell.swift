//
//  CustomCell.swift
//  tableViewPratice2
//
//  Created by 이진욱 on 2020/05/26.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
  
  let addButton = UIButton()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupAddButton()
  }
  
  required init?(coder: NSCoder) {
    fatalError("error")
  }
  
  override func layoutIfNeeded() {
    super.layoutIfNeeded()
  }
  
  func setupAddButton() {
    addButton.frame = CGRect (
      x: contentView.frame.maxX + 10,
      y: 5,
      width: contentView.frame.width / 5,
      height: contentView.frame.height - 10)
    addButton.setTitle("ADD", for: .normal)
    addButton.setTitleColor( .white, for: .normal)
    addButton.backgroundColor = .systemBlue
    addButton.layer.cornerRadius = 15
    addButton.clipsToBounds = true
    contentView.addSubview(addButton)
  }
}

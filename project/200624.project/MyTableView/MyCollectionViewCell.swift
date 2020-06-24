//
//  MyCollectionViewCell.swift
//  MyTableView
//
//  Created by 이진욱 on 2020/06/24.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "MyCollectionViewCell"
  
  let titleLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
    titleLabel.textColor = .white
    titleLabel.textAlignment = .center
    titleLabel.backgroundColor = .gray
    contentView.addSubview(titleLabel)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(code:) has not been implemented")
  }
}

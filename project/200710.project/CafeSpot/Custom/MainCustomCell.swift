//
//  MainCustomCell.swift
//  CafeSpot
//
//  Created by 이진욱 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class MainCustomCell: UICollectionViewCell {
  
  // MARK: - Property
  
  let customImageView = UIImageView()
  
  let customTitleLabel: UILabel = {
    let label = UILabel()
    label.shadowColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.textAlignment = .left
    return label
  }()
  
  let customSubLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 10)
    label.textAlignment = .left
    return label
  }()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupImageView()
  }
  
  private func setupImageView() {
    
    let margin: CGFloat = 5
    let guide = contentView.safeAreaLayoutGuide
    
    [customImageView, customTitleLabel, customSubLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      customImageView.topAnchor.constraint(equalTo: guide.topAnchor),
      customImageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -contentView.frame.height / 5),
      
      customTitleLabel.topAnchor.constraint(equalTo: customImageView.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      customTitleLabel.heightAnchor.constraint(equalToConstant: 15),
      
      customSubLabel.topAnchor.constraint(equalTo: customTitleLabel.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      customSubLabel.heightAnchor.constraint(equalToConstant: 10)
    ])
    customImageView.layer.cornerRadius = 30
    customImageView.clipsToBounds = true
  }
}

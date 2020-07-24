//
//  WeatherMainTableViewCell.swift
//  WeatherForecast
//
//  Created by 이진욱 on 2020/07/23.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class WeatherMainTableViewCell: UITableViewCell {
  
  // MARK: - Property
  
  var mainView = UIView()
  static let identifier = "WeatherMainTableViewCell"

  // MARK: - init View
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      setUI()
    }
  // MARK: - SetUp Layout
  
  func setUI() {
    
    let contentViewGuide = contentView.safeAreaLayoutGuide
    
    contentView.addSubview(mainView)
    mainView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      mainView.topAnchor.constraint(equalTo: contentViewGuide.topAnchor),
      mainView.leadingAnchor.constraint(equalTo: contentViewGuide.leadingAnchor),
      mainView.trailingAnchor.constraint(equalTo: contentViewGuide.trailingAnchor),
      mainView.bottomAnchor.constraint(equalTo: contentViewGuide.bottomAnchor)
    ])
  }

}

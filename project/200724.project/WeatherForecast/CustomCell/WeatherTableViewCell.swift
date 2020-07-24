//
//  WeatherTableViewCell.swift
//  WeatherForecast
//
//  Created by 이진욱 on 2020/07/21.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
  
  // MARK: - Property
  
  static let identifier = "WeatherTableViewCell"
  
  let dateLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
    lb.textColor = .white
    return lb
  }()
  
  let timeLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont.boldSystemFont(ofSize: 15)
    lb.textColor = .white
    return lb
  }()
  
  let temperatureImageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  let temperatureSubBarView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray
    return view
  }()
  
  
  let temperatureLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 35)
    lb.textColor = .white
    return lb
  }()
  
  // MARK: - init View
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
  
  }
  
  // MARK: - SetUp LayOut
  
  func setUI() {
    
    let margin: CGFloat = 10
    let imageSize: CGFloat = 50
    let subBarHeight: CGFloat = 1
    let maxMargin: CGFloat = 30
    
    [dateLabel, timeLabel, temperatureImageView, temperatureSubBarView, temperatureLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
      dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
      
      timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: margin),
      timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
      
      temperatureImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
      temperatureImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: maxMargin),
      temperatureImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      temperatureImageView.widthAnchor.constraint(equalToConstant: imageSize),
      
      temperatureSubBarView.centerXAnchor.constraint(equalTo: temperatureImageView.centerXAnchor),
      temperatureSubBarView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      temperatureSubBarView.widthAnchor.constraint(equalTo: temperatureImageView.widthAnchor),
      temperatureSubBarView.heightAnchor.constraint(equalToConstant: subBarHeight),
      
      temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -maxMargin),
      temperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
}

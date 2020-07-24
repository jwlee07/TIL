//
//  WeatherCustomView.swift
//  WeatherForecast
//
//  Created by 이진욱 on 2020/07/21.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class WeatherCustomView: UIView {
  
  // MARK: - Property
  
  let weatherMainView = UIView()
  let weatherCustomView = UIView()
  let weatherImageView = UIImageView()
  let weatherImageViewSubTitle: UILabel = {
    let lb = UILabel()
    lb.textColor = .white
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 30)
    return lb
  }()
  
  let minTemperatureImageView = UIImageView()
  let minTemperatureLabel: UILabel = {
    let lb = UILabel()
    lb.textColor = .white
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
    return lb
  }()
  let maxTemperatureImageView = UIImageView()
  let maxTemperatureLabel: UILabel = {
    let lb = UILabel()
    lb.textColor = .white
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
    return lb
  }()
  let mainWeatherLabel: UILabel = {
    let lb = UILabel()
    lb.textColor = .white
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 100)
    return lb
  }()
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  func setUI() {
    
    let margin: CGFloat = 10
    let imageSize: CGFloat = 50
    let temperatureImageSize: CGFloat = 20
    let viewMargin: CGFloat = 100
    
    self.addSubview(weatherMainView)
    weatherMainView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      weatherMainView.topAnchor.constraint(equalTo: self.topAnchor),
      weatherMainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      weatherMainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      weatherMainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
    
    weatherMainView.addSubview(weatherCustomView)
    weatherCustomView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      weatherCustomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      weatherCustomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      weatherCustomView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -viewMargin)
    ])
    
    [weatherImageView, weatherImageViewSubTitle, minTemperatureImageView, minTemperatureLabel, maxTemperatureImageView, maxTemperatureLabel, mainWeatherLabel].forEach {
      weatherCustomView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      weatherImageView.topAnchor.constraint(equalTo: weatherCustomView.topAnchor, constant: margin),
      weatherImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
      weatherImageView.widthAnchor.constraint(equalToConstant: imageSize),
      weatherImageView.heightAnchor.constraint(equalToConstant: imageSize),
      
      weatherImageViewSubTitle.leadingAnchor.constraint(equalTo: weatherImageView.trailingAnchor, constant: margin),
      weatherImageViewSubTitle.bottomAnchor.constraint(equalTo: weatherImageView.bottomAnchor),
      
      minTemperatureImageView.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: margin),
      minTemperatureImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
      minTemperatureImageView.widthAnchor.constraint(equalToConstant: temperatureImageSize),
      minTemperatureImageView.heightAnchor.constraint(equalToConstant: temperatureImageSize),
      
      minTemperatureLabel.leadingAnchor.constraint(equalTo: minTemperatureImageView.trailingAnchor, constant: margin),
      minTemperatureLabel.bottomAnchor.constraint(equalTo: minTemperatureImageView.bottomAnchor),
      
      maxTemperatureImageView.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: margin),
      maxTemperatureImageView.leadingAnchor.constraint(equalTo: minTemperatureLabel.trailingAnchor, constant: margin),
      maxTemperatureImageView.widthAnchor.constraint(equalToConstant: temperatureImageSize),
      maxTemperatureImageView.heightAnchor.constraint(equalToConstant: temperatureImageSize),
      
      maxTemperatureLabel.leadingAnchor.constraint(equalTo: maxTemperatureImageView.trailingAnchor, constant: margin),
      maxTemperatureLabel.bottomAnchor.constraint(equalTo: maxTemperatureImageView.bottomAnchor),
      
      mainWeatherLabel.topAnchor.constraint(equalTo: maxTemperatureLabel.bottomAnchor, constant: margin),
      mainWeatherLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
      mainWeatherLabel.bottomAnchor.constraint(equalTo: weatherCustomView.bottomAnchor)
    ])
  }
}

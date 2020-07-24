//
//  WeatherCasterViewController.swift
//  WeatherForecast
//
//  Created by 이진욱 on 2020/07/21.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class WeatherCasterViewController: UIViewController {
  
  // MARK: - Struct
  
  struct WeatherJSON: Codable {
    let cod: String
    let city: City
    let list: [List]
    
    struct List: Codable {
      let dt: Int
      let dt_txt: String
      let main: Main
      let weather: [Weather]
    }
    
    struct Main: Codable {
      let temp: Double
      let temp_min: Double
      let temp_max: Double
    }
    struct Weather: Codable {
      let description: String
      let icon: String
    }
    struct City: Codable {
      let name: String
    }
  }
  
  
  // MARK: - Property
  
  private let backGroundImageView = UIImageView()
  private let backGroundImageArr = ["sunny", "lightning", "cloudy", "rainy"].map {
    UIImage.init(named: $0)
  }
  private let topView = UIView()
  private var topCityLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont.boldSystemFont(ofSize: 20)
    lb.textColor = .white
    return lb
  }()
  
  private var topDateLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
    lb.textColor = .white
    return lb
  }()
  
  private let reloadButton: UIButton = {
    let btn = UIButton()
    btn.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
    btn.tintColor = .white
    return btn
  }()
  
  let weatherCustomView = WeatherCustomView()
  let weatherTableView = UITableView()
  var weatherTemp: [Double] = []
  var weatherMinTemp: [Double] = []
  var weatherMaxTemp: [Double] = []
  var weatherDescription: [String] = []
  var weatherICon: [String] = []
  var weatherDate: [String] = []
  var weatherDateYMD: [String] = []
  var weatherDateTime: [String] = []
  var dateComponents: [String] = []
  var tableCellDate: [String] = []
  var tableCellTime: [String] = []
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    getJSONData()
    setupBackGroundImageView()
    setUpTopView()
    setupTableView()
    setupmainCustomViewUI()
    dateFormatter()
  }
  override func viewWillLayoutSubviews() {
    weatherTableView.reloadData()
  }
  
  // MARK: - BackGround
  
  private func setupBackGroundImageView() {
    view.addSubview(backGroundImageView)
    backGroundImageView.image = backGroundImageArr[0]
    backGroundImageView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
      backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
  
  // MARK: - TopView
  
  private func setUpTopView() {
    
    let topViewHeight: CGFloat = 100
    let margin: CGFloat = 5
    let buttonMargin: CGFloat = 15
    
    backGroundImageView.addSubview(topView)
    topView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      topView.topAnchor.constraint(equalTo: backGroundImageView.topAnchor),
      topView.leadingAnchor.constraint(equalTo: backGroundImageView.leadingAnchor),
      topView.trailingAnchor.constraint(equalTo: backGroundImageView.trailingAnchor),
      topView.heightAnchor.constraint(equalToConstant: topViewHeight)
    ])
    
    [topCityLabel, topDateLabel, reloadButton].forEach {
      topView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      topCityLabel.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.topAnchor, constant: margin),
      topCityLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
      topDateLabel.topAnchor.constraint(equalTo: topCityLabel.bottomAnchor, constant: margin),
      topDateLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
      reloadButton.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.topAnchor, constant: buttonMargin),
      reloadButton.trailingAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.trailingAnchor, constant: -buttonMargin)
    ])
  }
  
  // MARK: - TableView
  
  private func setupTableView() {
    
    weatherTableView.dataSource = self
    weatherTableView.rowHeight = 100
    weatherTableView.backgroundColor = .clear
    weatherTableView.allowsSelection = false
    weatherTableView.register(WeatherMainTableViewCell.self, forCellReuseIdentifier: WeatherMainTableViewCell.identifier)
    weatherTableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
    
    let margin: CGFloat = 100
    
    view.addSubview(weatherTableView)
    weatherTableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      weatherTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: margin),
      weatherTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      weatherTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      weatherTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
  
  // MARK: - JSON Parshing
  
  private func getJSONData() {
    
    let jsonDecoder = JSONDecoder()
    
    let apiUrl = "https://api.openweathermap.org/data/2.5/forecast?id=1835848&APPID=4166848afb231e9869368c6da665c9a9"
    let url = URL(string: apiUrl)!
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil else {return print(error!)}
      guard let response = response as? HTTPURLResponse,
        (200..<400).contains(response.statusCode)
        else {return print ("Response Error")}
      guard let data = data else { return }
      do {
        let weatherData = try jsonDecoder.decode(WeatherJSON.self, from: data)
        for index in 0..<weatherData.list.count {
          self.weatherTemp.append(weatherData.list[index].main.temp)
          self.weatherMinTemp.append(weatherData.list[index].main.temp_min)
          self.weatherMaxTemp.append(weatherData.list[index].main.temp_max)
          self.weatherDescription.append(weatherData.list[index].weather[0].description)
          self.weatherICon.append(weatherData.list[index].weather[0].icon)
          self.weatherDate.append(weatherData.list[index].dt_txt)
        }
        DispatchQueue.main.async {
          self.topCityLabel.text = weatherData.city.name
          self.topDateLabel.text = weatherData.list.last?.dt_txt
        }
      } catch {
        print (error)
      }
    }
    dataTask.resume()
  }
  
  // MARK: - setupmainCustomViewUI
  
  private func setupmainCustomViewUI() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.weatherCustomView.weatherImageView.image = UIImage(named: self.weatherICon.first ?? "")
      self.weatherCustomView.weatherImageViewSubTitle.text = self.weatherDescription.first
      self.weatherCustomView.minTemperatureImageView.image = UIImage(systemName: "arrow.down.to.line.alt")?.withTintColor(.white, renderingMode: .alwaysOriginal)
      self.weatherCustomView.minTemperatureLabel.text = String(format: "%.1f", self.weatherMinTemp.first! - 273.15) + "°"
      self.weatherCustomView.maxTemperatureImageView.image = UIImage(systemName: "arrow.up.to.line.alt")?.withTintColor(.white, renderingMode: .alwaysOriginal)
      self.weatherCustomView.maxTemperatureLabel.text = String(format: "%.1f", self.weatherMaxTemp.first! - 273.15) + "°"
      self.weatherCustomView.mainWeatherLabel.text = String(format: "%.1f", self.weatherTemp.first! - 273.15) + "°"
    }
  }
  
  // MARK: - dateFomatter
  
  private func dateFormatter() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      for date in self.weatherDate {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월dd일"
        let resultDate = dateFormatter.date(from: date)
        print ("resultDate : ", resultDate!)
      }
    }
  }
}

// MARK: - UITableViewDataSource

extension WeatherCasterViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return weatherTemp.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let weatherCell = weatherTableView.dequeueReusableCell(withIdentifier: WeatherMainTableViewCell.identifier, for: indexPath) as! WeatherMainTableViewCell
      weatherCell.mainView = weatherCustomView
      weatherCell.backgroundColor = .clear
      weatherTableView.rowHeight = view.frame.height
      return weatherCell
    } else {
      let weatherCell = weatherTableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
      weatherCell.backgroundColor = .clear
      weatherCell.temperatureLabel.text = String(Int(weatherTemp[indexPath.row] - 273.15)) + "°"
      weatherCell.temperatureImageView.image = UIImage(named: weatherICon[indexPath.row])
      weatherCell.dateLabel.text = weatherDate[indexPath.row]
      weatherCell.timeLabel.text = weatherDate[indexPath.row]
      weatherTableView.rowHeight = 100
      return weatherCell
    }
  }
}

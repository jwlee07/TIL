//
//  ProductViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
  
  let detailVC = DetailViewController()
  var resultArrCount = 0
  let productTableView = UITableView()
  let productImageView = UIImageView()
  var productCell = UITableViewCell(style: .subtitle, reuseIdentifier: "Custom")
  
  
  let supersedeImageArr = [
    UIImage.init(named: "글램핑 바비큐"),
    UIImage.init(named: "알로하 하와이안"),
    UIImage.init(named: "우리 고구마"),
    UIImage.init(named: "콰트로 치즈 퐁듀"),
  ]
  let supersedeName = ["글램핑 바베큐", "알로하 하와이안", "우리 고구마", "콰트로 치즈 퐁듀"]
  let supersedePrice = ["20,000원", "23,000원", "21,000원", "21,000원"]
  
  let premiumImageArr = [
    UIImage.init(named: "더블크러스트 이베리코"),
    UIImage.init(named: "블랙앵거스 스테이크"),
    UIImage.init(named: "블랙타이거 슈림프"),
    UIImage.init(named: "와규 앤 비스테카"),
    UIImage.init(named: "직화 스테이크")
  ]
  let premiumName = ["더블크러스트 이베리코", "블랙앵거스 스테이크", "블랙타이거 슈림프", "와규 앤 비스테카", "직화 스테이크"  ]
  let classicImageArr = [
    UIImage.init(named: "베이컨체더치즈"),
    UIImage.init(named: "불고기"),
    UIImage.init(named: "슈퍼디럭스"),
    UIImage.init(named: "슈퍼슈프림"),
    UIImage.init(named: "페퍼로니"),
    UIImage.init(named: "포테이토")
  ]
  let classicName = ["베이컨체더치즈", "불고기", "슈퍼디럭스", "슈퍼슈프림", "페퍼로니", "포테이토"]
  let sidedishImageArr = [
     UIImage.init(named: "딸기 슈크림"),
     UIImage.init(named: "슈퍼곡물 치킨"),
     UIImage.init(named: "애플 크러스트 디저트"),
     UIImage.init(named: "치킨퐁듀 그라탕"),
     UIImage.init(named: "퀴노아 치킨 샐러드"),
     UIImage.init(named: "포테이토 순살치킨")
   ]
  let sidedishName = ["딸기 슈크림", "슈퍼곡물 치킨", "애플 크러스트 디저트", "치킨퐁듀 그라탕", "퀴노아 치킨 샐러드", "포테이토 순살치킨"]
  let drinkImageArr = [
    UIImage.init(named: "미닛메이드 스파클링 청포도"),
    UIImage.init(named: "스프라이트"),
    UIImage.init(named: "코카콜라 제로"),
    UIImage.init(named: "코카콜라")
    ]
  let drinkName = ["미닛메이드 스파클링 청포도", "스프라이트", "코카콜라 제로", "코카콜라"]
  let pickleSauceImageArr = [
    UIImage.init(named: "갈릭 디핑 소스"),
    UIImage.init(named: "스위트 칠리소스"),
    UIImage.init(named: "우리 피클 L"),
    UIImage.init(named: "우리 피클 M"),
    UIImage.init(named: "핫소스")
  ]
  let pickleSauceName = ["갈릭 디핑 소스", "스위트 칠리소스", "우리 피클 L", "우리 피클 M", "핫소스"]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupProductTableView()
  }
  func setupProductTableView() {
    productTableView.frame = view.frame
    productTableView.dataSource = self
    productTableView.delegate = self
    productTableView.rowHeight = 120
    productTableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
    view.addSubview(productTableView)
  }
  func setupProductImageView() {
    productImageView.frame = CGRect (
      x: 0,
      y: 0,
      width: 100,
      height: 100)
    view.addSubview(productImageView)
  }
}

extension ProductViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch title {
    case "슈퍼시드":
      resultArrCount = supersedeImageArr.count
    case "프리미엄":
      resultArrCount = premiumImageArr.count
    case "클래식":
      resultArrCount = classicImageArr.count
    case "사이드디시":
      resultArrCount = sidedishImageArr.count
    case "음료":
      resultArrCount = drinkImageArr.count
    case "피클&소스":
      resultArrCount = pickleSauceImageArr.count
    default:
      break
    }
    return resultArrCount
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    productCell = productTableView.dequeueReusableCell(withIdentifier: "Custom")!
    switch title {
    case "슈퍼시드":
      productCell.imageView?.image = supersedeImageArr[indexPath.row]
      productCell.textLabel?.text = supersedeName[indexPath.row]
      productCell.detailTextLabel?.text = supersedePrice[indexPath.row]
    case "프리미엄":
      productCell.imageView?.image = premiumImageArr[indexPath.row]
      productCell.textLabel?.text = premiumName[indexPath.row]
    case "클래식":
      productCell.imageView?.image = classicImageArr[indexPath.row]
      productCell.textLabel?.text = classicName[indexPath.row]
    case "사이드디시":
      productCell.imageView?.image = sidedishImageArr[indexPath.row]
      productCell.textLabel?.text = sidedishName[indexPath.row]
    case "음료":
      productCell.imageView?.image = drinkImageArr[indexPath.row]
      productCell.textLabel?.text = drinkName[indexPath.row]
    case "피클&소스":
      productCell.imageView?.image = pickleSauceImageArr[indexPath.row]
      productCell.textLabel?.text = pickleSauceName[indexPath.row]
    default:
      break
    }
    return productCell
  }
}

extension ProductViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch title {
    case "슈퍼시드":
      detailVC.title = supersedeName[indexPath.row]
      detailVC.detailImageView.image = supersedeImageArr[indexPath.row]
    case "프리미엄":
      detailVC.title = premiumName[indexPath.row]
      detailVC.detailImageView.image = premiumImageArr[indexPath.row]
    case "클래식":
      detailVC.title = classicName[indexPath.row]
      detailVC.detailImageView.image = classicImageArr[indexPath.row]
    case "사이드디시":
      detailVC.title = sidedishName[indexPath.row]
      detailVC.detailImageView.image = sidedishImageArr[indexPath.row]
    case "음료":
      detailVC.title = drinkName[indexPath.row]
      detailVC.detailImageView.image = drinkImageArr[indexPath.row]
    case "피클&소스":
      detailVC.title = pickleSauceName[indexPath.row]
      detailVC.detailImageView.image = pickleSauceImageArr[indexPath.row]
    default:
      break
    }
    navigationController?.pushViewController(detailVC, animated: true)
  }
}

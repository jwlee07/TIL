//
//  ProductViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
  
  var indexCheck = 0
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
  let supersedeDic: [String:String] = ["글램핑 바비큐":"20,000"]
  
  
  let premiumImageArr = [
    UIImage.init(named: "더블크러스트 이베리코"),
    UIImage.init(named: "블랙앵거스 스테이크"),
    UIImage.init(named: "블랙타이거 슈림프"),
    UIImage.init(named: "와규 앤 비스테카"),
    UIImage.init(named: "직화 스테이크")
  ]
  let classicImageArr = [
    UIImage.init(named: "베이컨체더치즈"),
    UIImage.init(named: "불고기"),
    UIImage.init(named: "슈퍼디럭스"),
    UIImage.init(named: "슈퍼슈프림"),
    UIImage.init(named: "페퍼로니"),
    UIImage.init(named: "포테이토")
  ]
  let sidedishImageArr = [
     UIImage.init(named: "딸기 슈크림"),
     UIImage.init(named: "슈퍼곡물 치킨"),
     UIImage.init(named: "슈퍼디럭스"),
     UIImage.init(named: "슈퍼슈프림"),
     UIImage.init(named: "페퍼로니"),
     UIImage.init(named: "포테이토")
   ]
  let drinkImageArr = [
    UIImage.init(named: "미닛메이드 스파클링 청포도"),
    UIImage.init(named: "스프라이트"),
    UIImage.init(named: "코카콜라 제로"),
    UIImage.init(named: "코카콜라")
    ]
  let pickleSauceImageArr = [
    UIImage.init(named: "갈릭 디핑 소스"),
    UIImage.init(named: "스위트 칠리소스"),
    UIImage.init(named: "우리 피클 L"),
    UIImage.init(named: "우리 피클 M"),
    UIImage.init(named: "핫소스")
  ]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupProductTableView()
  }
  func setupProductTableView() {
    productTableView.frame = view.frame
    productTableView.dataSource = self
    productTableView.delegate = self
    productTableView.rowHeight = 100
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
    case "프리미엄":
      productCell.imageView?.image = premiumImageArr[indexPath.row]
    case "클래식":
      productCell.imageView?.image = classicImageArr[indexPath.row]
    case "사이드디시":
      productCell.imageView?.image = sidedishImageArr[indexPath.row]
    case "음료":
      productCell.imageView?.image = drinkImageArr[indexPath.row]
    case "피클&소스":
      productCell.imageView?.image = pickleSauceImageArr[indexPath.row]
    default:
      break
    }
    return productCell
  }
}

extension ProductViewController: UITableViewDelegate {

}

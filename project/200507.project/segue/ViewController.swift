//
//  ViewController.swift
//  segue
//
//  Created by 이진욱 on 2020/05/07.
//  Copyright © 2020 jwlee. All rights reserved.
//


//FirstVC 에 Dog, Cat, Bird 라는 이름의 Button을 3개 만들고 숫자를 표시하기 위한 Label 하나 생성
//SecondVC 에 UIImageView 하나와 Dismiss 를 위한 버튼 하나 생성
//FirstVC에 있는 버튼 3개 중 하나를 누르면 그 타이틀에 맞는 이미지를 SecondVC의 ImageView 에 넣기
//  (이미지는 구글링 등을 통해 활용)
//각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 초과되면 화면이 전환되지 않도록 막기
//  (전환 횟수가 초과된 버튼은 그것만 막고, 횟수가 초과되지 않은 버튼으로는 전환 가능)
//SecondVC에 추가로 UIButton 을 하나 생성하여 그 버튼을 누를 때마다 개와 고양이, 새 모두에 대해 전환 횟수가 각각 1회씩 추가되도록 구현

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var dogCountLabel: UILabel!
  @IBOutlet weak var catCountLabel: UILabel!
  @IBOutlet weak var birdCountLabel: UILabel!
  
  let dogImage = UIImage(named: "dog.jpeg")
  let catImage = UIImage(named: "cat.jpeg")
  let birdImage = UIImage(named: "bird.jpeg")
  
  var dogCount = 0 {
    didSet {
      dogCountLabel.text = String(dogCount)
    }
  }
  var catCount = 0 {
    didSet {
      catCountLabel.text = String(catCount)
    }
  }
  var birdCount = 0 {
    didSet {
      birdCountLabel.text = String(birdCount)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
    
  }
  @IBAction func unwindToViewController2(_ unwindSegue: UIStoryboardSegue) {
    if dogCount < 8 { dogCount += 1}
    if catCount < 10 { catCount += 1}
    if birdCount < 15 { birdCount += 1}
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    if let secondVC = segue.destination as? SecondViewController {
      switch segue.identifier {
      case "idenDog":
        dogCount += 1
        secondVC.imageChange = dogImage!
      case "idenCat":
        catCount += 1
        secondVC.imageChange = catImage!
      case "idenBird":
        birdCount += 1
        secondVC.imageChange = birdImage!
      default:
        break
      }
    }
  }
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
    switch identifier {
    case "idenDog":
      guard dogCount < 8 ? true : false else { return false }
    case "idenCat":
      guard catCount < 10 ? true : false else { return false }
    case "idenBird":
      guard birdCount < 15 ? true : false else { return false }
    default:
      break
    }
    return true
  }
}




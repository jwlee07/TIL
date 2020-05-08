//
//  ViewController.swift
//  dogCatChange
//
//  Created by 이진욱 on 2020/05/08.
//  Copyright © 2020 jwlee. All rights reserved.


import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var imageVIew: UIImageView!
  @IBOutlet weak var switchButton: UISwitch!
  
  let userDefault = UserDefaults.standard
  let dogImage = UIImage(named: "dog.jpg")
  let catImage = UIImage(named: "cat.jpg")
  let imageInit = UIImage()
  
  struct Key {
    static let switchButton = "switchButton"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let switchCheck = userDefault.bool(forKey: Key.switchButton)
    switchButton.setOn(switchCheck, animated: true)
    
    print (switchCheck)
    
    if switchCheck == true {
      imageVIew.image = dogImage
    } else {
      imageVIew.image = catImage
    }
  }
  @IBAction func actionSwitchButton(_ sender: UISwitch) {
    
    userDefault.set(switchButton.isOn, forKey: Key.switchButton)
    let switchCheck = userDefault.bool(forKey: Key.switchButton)
    switchButton.setOn(switchCheck, animated: true)

    if switchCheck == true {
      imageVIew.image = dogImage
    } else {
      imageVIew.image = catImage
    }
  }
}

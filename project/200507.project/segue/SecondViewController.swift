//
//  SecondViewController.swift
//  segue
//
//  Created by 이진욱 on 2020/05/07.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  var imageChange = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
      imageView.image = imageChange
    }
}


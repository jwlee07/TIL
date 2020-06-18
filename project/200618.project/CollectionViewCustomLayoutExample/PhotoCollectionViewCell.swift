//
//  PhotoCollectionViewCell.swift
//  CollectionViewExample
//
//  Copyright © 2020년 Giftbot. All rights reserved.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "PhotoCollectionViewCell"
  
  @IBOutlet private weak var imageView: UIImageView!
  
  // MARK: LifeCycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 5.0
    layer.masksToBounds = true
  }
  
  // MARK: Configure Cell
  
  func configureCell(image: UIImage) {
    imageView.image = image
  }
}

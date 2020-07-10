//
//  VisibleCafeCell.swift
//  CafeSpot
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class VisibleSpotCell: UICollectionViewCell {
  
  static let identifier = "VisibleCafeCell"
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  
  
  // MARK: - Configure Cell

  func configure(
    image: UIImage?,
    title: String?,
    description: String?
  ) {
    imageView.image = image
    titleLabel.text = title
    descriptionLabel.text = description
  }
}

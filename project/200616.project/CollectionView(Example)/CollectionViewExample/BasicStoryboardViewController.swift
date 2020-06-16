//
//  BasicStoryboardViewController.swift
//  CollectionViewExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class BasicStoryboardViewController: UIViewController {

  @IBOutlet private weak var collectionView: UICollectionView!
  
  let parkImage = ParkManager.imageNames(of: .nationalPark)
  
  
}

extension BasicStoryboardViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return parkImage.count * 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasicCell", for: indexPath)
    if let imageView = cell.contentView.subviews.first as? UIImageView {
      imageView.image = UIImage(named: parkImage[indexPath.row % parkImage.count])
    }
    cell.layer.cornerRadius = cell.frame.width / 2
    cell.backgroundColor = .green
    return cell
  }
}


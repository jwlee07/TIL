//
//  ViewController.swift
//  CollectionViewPractice
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  // MARK: - LifeCycle
  
  var collectionCell = CustomCell()
  let collectionLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionLayout)
  var catImage: [UIImage] = []
  var customView = UIImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCatImage()
    setupCollectionView()
    setupCustomView()
  }
  private func setupCatImage() {
    for _ in 0...1 {
      for index in catImageText.compactMap(UIImage.init(named:)) {
        catImage.append(index)
      }
    }
  }
  
  func setupCustomView() {
    let collectionCellImageView = collectionCell.imageView
    collectionCellImageView.addSubview(customView)
    customView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      customView.topAnchor.constraint(equalTo: collectionCellImageView.topAnchor),
      customView.leadingAnchor.constraint(equalTo: collectionCellImageView.leadingAnchor),
      customView.trailingAnchor.constraint(equalTo: collectionCellImageView.trailingAnchor),
      customView.bottomAnchor.constraint(equalTo: collectionCellImageView.bottomAnchor)
    ])
    customView.contentMode = .scaleAspectFill
    customView.clipsToBounds = true
    customView.image = UIImage(systemName: "checkmark.circle.fill")
    customView.alpha = 0
  }
  
  private func setupCollectionView() {
    collectionLayout.itemSize = CGSize (width: (view.frame.width / 2) - 20, height: view.frame.width / 2)
    collectionLayout.minimumInteritemSpacing = 10
    collectionLayout.minimumLineSpacing = 10
    collectionLayout.sectionInset = UIEdgeInsets (top: 10, left: 10, bottom: 10, right: 10)
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .systemBackground
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "Custom")
    view.addSubview(collectionView)
  }
  
  // MARK: - Action

}


// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return catImage.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Custom", for: indexPath) as! CustomCell
    collectionCell.contentView.backgroundColor = .black
    collectionCell.layer.cornerRadius = 15
    collectionCell.clipsToBounds = true
    collectionCell.imageView.image = catImage[indexPath.item % catImage.count]
    return collectionCell
  }
}
extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let checkCell = collectionView.cellForItem(at: indexPath) as? CustomCell {
      if checkCell.isSelected {
        checkCell.imageView.alpha = 0.5
        
      } else {
        checkCell.imageView.alpha = 1
      }
    }
  }
}


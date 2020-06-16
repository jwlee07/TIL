//
//  BasicViewController.swift
//  CollectionViewExercises
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

// [ 문제 ]
// edgeInset은 각각 8, 셀 간격과 줄 간격 = 4
// 아이템 크기는 한 줄에 4개가 나올 수 있도록 설정. 크기는 차이나도 무방

final class BasicViewController: UIViewController {
  
  let dataSource = cards
  let collectionLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionLayout)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
  }
  
  func setupCollectionView() {
    collectionLayout.itemSize = CGSize (width: view.frame.width / 5, height: view.frame.width / 5)
    collectionLayout.minimumLineSpacing = 4
    collectionLayout.minimumInteritemSpacing = 4
    collectionLayout.sectionInset = UIEdgeInsets (top:8, left: 8, bottom: 8, right: 8)
    
    collectionView.backgroundColor = .systemBackground
    collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Custom")
    view.addSubview(collectionView)
  }
}

// MARK: - UICollectionViewDataSource

extension BasicViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Custom", for: indexPath)
    collectionCell.backgroundColor = dataSource[indexPath.item].color
    return collectionCell
  }
}

//
//  BasicCodeViewController.swift
//  CollectionViewExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class BasicCodeViewController: UIViewController {
  
  let itemCount = 100
  var collectionView: UICollectionView!
  var controllerStackView: UIStackView!
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSliders()
    setupCollectionView()
    setupNavigationItem()
  }

  // MARK: Setup Views
  
  func setupSliders() {
    // 셀 크기
    let sizeSlider = UISlider()
    sizeSlider.minimumValue = 10
    sizeSlider.maximumValue = 200
    sizeSlider.value = 50
    
    // 셀 간격
    let spacingSlider = UISlider()
    spacingSlider.minimumValue = 0
    spacingSlider.maximumValue = 50
    spacingSlider.value = 10
    spacingSlider.tag = 1
    
    // 셀 외부여백
    let edgeSlider = UISlider()
    edgeSlider.minimumValue = 0
    edgeSlider.maximumValue = 50
    edgeSlider.value = 10
    edgeSlider.tag = 2
    
    let sliders = [sizeSlider, spacingSlider, edgeSlider]
    sliders.forEach {
      $0.addTarget(self, action: #selector(editLayout), for: .valueChanged)
    }
    
    let stackView = UIStackView(arrangedSubviews: sliders)
    view.addSubview(stackView)
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.spacing = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      stackView.widthAnchor.constraint(equalToConstant: 300)
    ])
    controllerStackView = stackView
  }
  
  func setupCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 60, height: 60)
    layout.minimumInteritemSpacing = 10
    layout.minimumLineSpacing = 10
    layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    collectionView.backgroundColor = .systemBackground
    collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    view.addSubview(collectionView)
    
    collectionView.translatesAutoresizingMaskIntoConstraints.toggle()
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: controllerStackView.bottomAnchor, constant: 10),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
  
  func setupNavigationItem() {
    let changeDirection = UIBarButtonItem (barButtonSystemItem: .reply, target: self, action: #selector(changeCollectionViewDirection))
    navigationItem.rightBarButtonItem = changeDirection
  }
  
  
  @objc private func editLayout(_ sender: UISlider) {
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    
    if sender.tag == 0 {
      let size = CGFloat(sender.value)
      layout.itemSize = CGSize(width: size, height: size)
      
    } else if sender.tag == 1 {
      layout.minimumLineSpacing = CGFloat(sender.value)
      layout.minimumInteritemSpacing = CGFloat(sender.value)
      
    } else if sender.tag == 2 {
      let insetSize = CGFloat(sender.value)
      let inset = UIEdgeInsets(top: insetSize, left: insetSize, bottom: insetSize, right: insetSize)
      layout.sectionInset = inset
    }
  }
  
  // MARK: - Action
  
  @objc private func changeCollectionViewDirection(_ sender: Any) {
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    let current = layout.scrollDirection
    layout.scrollDirection = current == .horizontal ? .vertical : .horizontal
  }
}


// MARK: - UICollectionViewDataSource

extension BasicCodeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return itemCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    cell.backgroundColor = [.red, .green, .blue, .magenta, .gray, .orange, .cyan].randomElement()
    return cell
  }
}

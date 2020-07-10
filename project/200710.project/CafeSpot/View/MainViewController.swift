//
//  MainViewController.swift
//  CafeSpot
//
//  Created by 이진욱 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

// 프로토콜은
// 던져줄때 호츨하고
// 받을 때 구현하고

import UIKit

class MainViewController: UIViewController {

  // MARK: - Property
  
  let topLabel: UILabel = {
    let label = UILabel()
    label.text = "Cafe Spot"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 50)
    return label
  }()
  
  let serachTextfield: UITextField = {
    let textfield = UITextField()
    textfield.placeholder = "🔍 검색..."
    textfield.borderStyle = .roundedRect
    textfield.backgroundColor = .systemGray6
    return textfield
  }()
  
  var cafeListMain: [CafeListStruct] = []
  
  let cafeLayout = UICollectionViewFlowLayout()
  lazy var cafeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: cafeLayout)
  
  let jsonDecoder = JSONDecoder()
  
  let cafeListCatchVC = CafeListCatch()
    
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    hiddenNavigation()
    setUpView()
    setCafeCollectionView()
  }
  // MARK: - set keyboard
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    self.view.endEditing(true)
  }
  
  // MARK: - setup Layout
  
  private func hiddenNavigation() {
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.layoutIfNeeded()
  }
  
  private func setCafeCollectionView() {
    cafeListCatchVC.cafeListCatch()
    
    let widthSize = view.frame.width / 2.3
    let heightSize = view.frame.height / 4
    let spacingSize: CGFloat = 10
    let insetSize: CGFloat = 10
    
    cafeLayout.itemSize = CGSize (width: widthSize, height: heightSize)
    cafeLayout.minimumLineSpacing = spacingSize
    cafeLayout.minimumInteritemSpacing = spacingSize
    cafeLayout.sectionInset = UIEdgeInsets(top: insetSize, left: insetSize, bottom: insetSize, right: insetSize)
    
    cafeCollectionView.backgroundColor = .systemBackground
    cafeCollectionView.dataSource = self
    cafeCollectionView.delegate = self
    cafeCollectionView.register(MainCustomCell.self, forCellWithReuseIdentifier: "Custom")
  }
  
  private func setUpView() {
    
    cafeListCatchVC.delegate = self
    
    let padding:CGFloat = 10
    let margin: CGFloat = 50
    
    let guide = view.safeAreaLayoutGuide
    
    [topLabel, serachTextfield, cafeCollectionView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding).isActive = true
    }
    
    NSLayoutConstraint.activate([
      topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: margin),
      
      serachTextfield.topAnchor.constraint(equalTo: topLabel.safeAreaLayoutGuide.bottomAnchor, constant: padding),
      serachTextfield.heightAnchor.constraint(equalToConstant: margin),
      
      cafeCollectionView.topAnchor.constraint(equalTo: serachTextfield.safeAreaLayoutGuide.bottomAnchor, constant: padding),
      cafeCollectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
  }
}

// MARK: - extension

extension MainViewController: UICollectionViewDelegate {
  
}

extension MainViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    cafeListMain.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let customCell = cafeCollectionView.dequeueReusableCell(withReuseIdentifier: "Custom", for: indexPath) as! MainCustomCell
    customCell.customImageView.image = UIImage(named: cafeListMain[indexPath.item].title)
    customCell.customTitleLabel.text = cafeListMain[indexPath.item].title
    customCell.customSubLabel.text = cafeListMain[indexPath.item].description
    return customCell
  }
}
  
extension MainViewController: CafeListCatchDelegate {
  func cafeCatch(cafeList: [CafeListStruct]) {
    cafeListMain = cafeList
  }
}

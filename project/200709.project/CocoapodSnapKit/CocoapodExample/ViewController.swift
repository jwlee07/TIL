//
//  ViewController.swift
//  CocoapodExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

  let squareView = UIView()
  let topView = UIView()
  let topLabel = UILabel()
  let bottomView = UIView()
  let bottomLabel = UILabel()
  let bottomCircleView = UIView()
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    makeConstraints()
  }
  
  func setupView() {
    squareView.backgroundColor = .green
    view.addSubview(squareView)
    
    topView.backgroundColor = .black
    squareView.addSubview(topView)

    bottomView.backgroundColor = .yellow
    squareView.addSubview(bottomView)
    
    topLabel.text = "TopView"
    topLabel.textColor = .white
    topLabel.textAlignment = .center
    topLabel.font = UIFont.boldSystemFont(ofSize: 25)
    topView.addSubview(topLabel)
    
    bottomLabel.text = "BottomView"
    bottomLabel.textAlignment = .center
    bottomLabel.font = UIFont.boldSystemFont(ofSize: 25)
    bottomView.addSubview(bottomLabel)
    
    bottomCircleView.backgroundColor = .cyan
    view.addSubview(bottomCircleView)
  }

  func makeConstraints() {
    squareView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.centerY.equalToSuperview().offset(-40)
      $0.width.equalToSuperview().multipliedBy(0.7)
      $0.height.equalToSuperview().multipliedBy(0.4)
    }
    
    topView.snp.makeConstraints {
      $0.leading.trailing.top.equalToSuperview().inset(20)
    }
    
    bottomView.snp.makeConstraints {
      $0.top.equalTo(topView.snp.bottom)
      $0.height.equalTo(topView)
      $0.leading.bottom.trailing.equalToSuperview().inset(20)
    }
    
    topLabel.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    bottomLabel.snp.makeConstraints {
      $0.size.equalTo(topLabel)
      $0.leading.bottom.equalToSuperview()
    }
    
    bottomCircleView.snp.makeConstraints {
      $0.top.equalTo(squareView.snp.bottom)
      $0.centerX.equalTo(squareView)
      $0.width.height.equalTo(squareView.snp.width).dividedBy(2)
    }
    
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    bottomCircleView.layer.cornerRadius = bottomCircleView.frame.width / 2
  }
  /*
   [ SnapKit ]
   makeConstraints : 최초 제약 설정
   updateConstraints : 이미 설정한 특정 값을 다른 것으로 바꿀때
   remakeConstraints : 기존의 연결을 모두 제거하고 완전히 새로 결정
   */
  
  // MARK: Action
  
  @IBAction private func updateLayout(_ sender: UIBarButtonItem) {
    UIView.animate(withDuration: 1) {
      self.bottomCircleView.snp.updateConstraints {
        $0.top.equalTo(self.squareView.snp.bottom).offset((-300...100).randomElement()!)
      }
      self.view.layoutIfNeeded()
    }
  }
}


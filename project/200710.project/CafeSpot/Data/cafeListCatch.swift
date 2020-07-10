//
//  cafeListCatch.swift
//  CafeSpot
//
//  Created by 이진욱 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

// MARK: - Protocol

protocol CafeListCatchDelegate {
  func cafeCatch(cafeList: [CafeListStruct])
}

class CafeListCatch {
  // MARK: - Property
  
  var delegate: CafeListCatchDelegate?
  let jsonDecoder = JSONDecoder()
  
  // MARK: - Catch CafeList
  
  func cafeListCatch() {
    if let jsonDataUrl = Bundle.main.url(forResource: "CafeList", withExtension: "json") {
      let jsonData = try! Data(contentsOf: jsonDataUrl)
      print (jsonData)
      do {
        let cafeList = try jsonDecoder.decode([CafeListStruct].self, from: jsonData)
        print (cafeList)
        delegate?.cafeCatch(cafeList: cafeList)
      } catch {
        print (error)
      }
    }
  }
}


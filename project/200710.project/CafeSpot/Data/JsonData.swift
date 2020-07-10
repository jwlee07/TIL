//
//  JsonData.swift
//  CafeSpot
//
//  Created by 이진욱 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

struct CafeListStruct: Decodable {
  var title: String
  var description: String
  var location: Location
  var isFavorite: Bool

  struct Location: Decodable {
    let address: String
    let lat: Double
    let lng: Double
  }
}

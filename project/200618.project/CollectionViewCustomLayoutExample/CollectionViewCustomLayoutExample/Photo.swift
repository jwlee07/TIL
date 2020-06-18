//
//  Photo.swift
//  CollectionViewExample
//
//  Copyright © 2020년 Giftbot. All rights reserved.
//

import Foundation

enum PhotoType: String {
  case cat, dog
}

struct Photo {
  let imageName: String
  let photoType: PhotoType
}


//
//  PhotoCollectionViewLayout.swift
//  CollectionViewExample
//
//  Copyright © 2020년 Giftbot. All rights reserved.
//

import UIKit

protocol PhotoCollectionViewLayoutDelegate: class {
  func photoCollectionView(_ collectionView: UICollectionView, layout collectionViewLayout: PhotoCollectionViewLayout, sizeForPhotoAt indexPath: IndexPath) -> CGSize
}

final class PhotoCollectionViewLayout: UICollectionViewLayout {

  struct Layout {
    let numberOfColumns: Int
    let itemSize: CGSize
    let lineSpacing: CGFloat
    let interItemSpacing: CGFloat
    
    static let `default` = Layout(
      numberOfColumns: 2,
      itemSize: CGSize(width: 160, height: 120),
      lineSpacing: 10,
      interItemSpacing: 10
    )
  }
  weak var delegate: PhotoCollectionViewLayoutDelegate!
  
  var layout: Layout = .default
  
  private var layoutAttributes: [UICollectionViewLayoutAttributes] = []
  private var contentHeight: CGFloat = 0
  
  private var contentWidth: CGFloat {
    guard let cv = collectionView else { return 0 }
    let horizontalontentInset = cv.contentInset.left + cv.contentInset.right
    return cv.bounds.width - horizontalontentInset
  }
  
  override func invalidateLayout() {
    layoutAttributes.removeAll()
    super.invalidateLayout()
  }
  
  // 1단계 : prepare
  
  override func prepare() {
    guard let collectionView = collectionView, layoutAttributes.isEmpty else { return }
    let columnsCount = layout.numberOfColumns
    let totalItemSpacing = CGFloat(columnsCount - 1) * layout.interItemSpacing
    let cellWidth = (contentWidth - totalItemSpacing) / CGFloat(columnsCount)
    
    var xOffset: [CGFloat] = []
    var yOffset: [CGFloat] = Array(repeating: 0, count: columnsCount)
    
    
    for column in 0..<columnsCount {
      let startOffset = CGFloat(column) * (cellWidth + layout.interItemSpacing)
      xOffset.append(startOffset)
    }
    
    let numberOfItem = collectionView.numberOfItems(inSection: 0)
    var columnIndex = 0
    
    for item in 0..<numberOfItem {
      let indexPath = IndexPath(item: item, section: 0)
      let photoSize = delegate.photoCollectionView(collectionView, layout: self, sizeForPhotoAt: indexPath)
      let ratio = photoSize.width / cellWidth // 1500 / 300 = 5
      let cellHeight = (photoSize.height) / ratio // 1000 / 5 = 200
      
      let minYOffest = yOffset.min() ?? 0
      columnIndex = yOffset.firstIndex(of: minYOffest) ?? 0
      
      let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
      attributes.frame = CGRect (
        x: xOffset[columnIndex], y: yOffset[columnIndex],
        width: cellWidth, height: cellHeight
      )
      layoutAttributes.append(attributes)
      yOffset[columnIndex] += cellHeight + layout.lineSpacing
    }
    self.contentHeight = (yOffset.max() ?? 0) - layout.lineSpacing
  }
  
  // 2단계 : collectionViewConteneSize
  override var collectionViewContentSize: CGSize {
    guard let _ = collectionView else { return.zero}
    return CGSize (width: contentWidth, height: contentHeight)
  }
  
  // 3단계 : lauoutAttributesForElements(in rect: CGRect)
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    return layoutAttributes.filter {$0.frame.intersects(rect)}
  }
  
  // 해당 indexPath에 속한 Item 정보를 주는 것.
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return layoutAttributes.first { $0.indexPath == indexPath }
  }
}


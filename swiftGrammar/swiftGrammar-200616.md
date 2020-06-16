## UICollectionView

* 정렬된 자료들을 사용자가 원하는 형식에 맞게 유연하게 표현할수 있는 객체

### Merging Content and Layout

![UICollectionView_1](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_1.png)

### Three Types Of Visual Elements
* 셀(Cell)
```
컬렉션 뷰의 단일 데이터 항목을 표현하는 개체이며, 레이아웃에 의해 배치되는 주요 요소  
각 셀은 다중 섹션으로 나누거나 하나의 그룹으로만 묶어 표현할 수 있음  
컬렉션 뷰의 컨텐츠 영역에 셀들을 배열하는 것이 레이아웃 객체(Layout Object)의 주 업무  
```

* 보조(보충) 뷰 (Supplementary views)
```
섹션 또는 컬렉션 뷰 자체에 대한 헤더와 푸터 같은 역할을 하는 뷰  
셀처럼 데이터를 표현할 수 있는 것은 같지만, 유저가 선택할 수 없는 뷰  
선택사항(Optional)이며, 높이를 0으로 설정하면 미생성  
```

* 장식 뷰 (Decoration views)
```
컬렉션 뷰의 배경을 꾸미는 데 사용하는 시각적 장식용 뷰  
선택사항이며, 유저가 선택할 수 없고 레이아웃 객체를 통해 정의  
```

### CollectionView Layout

![UICollectionView_2](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_2.png)

### FlowLayout
* UICollectionViewFlowLayout Class
* Scroll Direction - Vertical (수직) / Horizontal (수평)

![UICollectionView_3](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_3.png)

### Section Layout

![UICollectionView_4](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_4.png)

### Item Size

![UICollectionView_5](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_5.png)

```swift
func collectionView(
_ collectionView: UICollectionView,
layout collectionViewLayout: UICollectionViewLayout,
sizeForItemAt indexPath: IndexPath) -> CGSize
```

### Section Inset

![UICollectionView_6](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_6.png)

```swift
func collectionView(
_ collectionView: UICollectionView,
layout collectionViewLayout: UICollectionViewLayout,
insetForSectionAt section: Int) -> UIEdgeInsets
```

### Line spacing

![UICollectionView_7](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_7.png)

```swift
func collectionView(
_ collectionView: UICollectionView,
layout collectionViewLayout: UICollectionViewLayout,
minimumLineSpacingForSectionAt section: Int) -> CGFloat
```

### Interitem spacing

![UICollectionView_8](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_8.png)

```swift
func collectionView(
_ collectionView: UICollectionView,
layout collectionViewLayout: UICollectionViewLayout,
minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
```

### Header / FooterSize

![UICollectionView_9](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_9.png)

```swift
func collectionView(
_ collectionView: UICollectionView,
layout collectionViewLayout: UICollectionViewLayout,
referenceSizeForHeaderInSection section: Int) -> CGFloat
```

```swift
func collectionView(
_ collectionView: UICollectionView,
layout collectionViewLayout: UICollectionViewLayout,
referenceSizeForFooterInInSection section: Int) -> CGFloat
```

### Layout Metrics

![UICollectionView_10](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_10.png)

### Cell Hierarchy

![UICollectionView_11](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_11.png)

### The State of a Cell

![UICollectionView_12](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/UICollectionView/UICollectionView_12.png)

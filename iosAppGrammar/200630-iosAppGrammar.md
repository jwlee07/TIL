# UIGestureRecognizer

## GestureRecognizer Type

```
- 탭 : Tap
- 확대 / 축소 : Pinch
- 회전 : Rotation
- 특정방향으로 밀기 : Swipe
- 드래깅 : Pan
- 오래 누르기 : LongPress
- 화면 모서리 드래깅 : ScreenEdgePan
```

![UIGestureRecognizer_1](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIGestureRecognizer/UIGestureRecognizer_1.png)

## GestureRecognizer Type

![UIGestureRecognizer_2](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIGestureRecognizer/UIGestureRecognizer_2.png)

![UIGestureRecognizer_3](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIGestureRecognizer/UIGestureRecognizer_3.png)

## Gesture recognizer notifying its target

![UIGestureRecognizer_4](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIGestureRecognizer/UIGestureRecognizer_4.png)

## Code

```swift
override func viewDidLoad() {
 super.viewDidLoad()
 let tapGesture = UITapGestureRecognizer(
)
target: self,
action: #selector(handleTap(_:))
view.addGestureRecognizer(tapGesture)
}
@objc func handleTap(_ sender: UITapGestureRecognizer) {
// code
}
```

## Storyboard

![UIGestureRecognizer_5](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIGestureRecognizer/UIGestureRecognizer_5.png)

## Attributes Inspector

* 각 Recpgnizer는 서로 다른 속성을 지님
* 단, 공통 부모 클래스인 Gesture Recognizer에 대해서는 동일

![UIGestureRecognizer_6](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIGestureRecognizer/UIGestureRecognizer_6.png)

## The states of a gesture

![UIGestureRecognizer_7](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIGestureRecognizer/UIGestureRecognizer_7.png)



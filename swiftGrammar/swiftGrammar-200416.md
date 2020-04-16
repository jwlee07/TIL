## Optionals


#### Type Declaration
* 값이 없을 수 있는 상황에 사용
* 2가지 경우의 수
	* 값이 없음
	* 값이 있음, 접근을 위헤 옵셔널 unwrap 가능
* Optional -> NonOptional (X)
* Optional <- NonOptional (O)
```swift
let possibleNumber = "123" -> 123
var convertedNumber = Int(possibleNumber) -> nil
type(of: convertedNumber) -> Optional<Int>.Type

 var <variable name>: <Type?>
 var <variable name>: <Optional<Type>>
```

#### UnWrapping

* Forced
```swift
if convertedNumber != nil {
}
````

* Binding
```swift
 if let <nonOptional> = <OptionalExpression> {
   <Code>
 }
 while let <nonOptional> = <OptionalExpression> {
   <Code>
 }
 guard let <nonOptional> = <OptionalExpression> else {
   <Code>
 }
```

## Enum

#### Type Declaration
* 연관된 값의 그룹에 공통 타입을 정의 한 후 해당 값들 사용

```
enum CompassPoint {
  case north
  case south
  case east
  case west
}
```

#### Raw Value
```swift
enum Gender: String {
  case male = "남자", female = "여자", other = "기타"
}

Gender.male -> male
Gender.male.rawValue -> "남자"

enum WeekdayAgain: Int {
  case sunday = 5, monday, tuesday, wednesday, thursday, friday, saturday
//  case sunday, monday = 100, tuesday = 101, wednesday, thursday, friday, saturday
//  case sunday = 1, monday = 1, tuesday = 2, wednesday, thursday, friday, saturday
}

WeekdayAgain.sunday -> sunday
WeekdayAgain.sunday.rawValue -> 5

WeekdayAgain.wednesday -> wednesday
WeekdayAgain.wednesday.rawValue -> 8
```

#### Nested
```swift
enum Device: String {
  case iPhone, iPad, tv, watch
  
  func printType() {
    switch self {
    case .iPad, .iPhone, .tv:
      print("device :", self)
    case .watch:
      print("apple Watch")
    }
  }
}

let iPhone = Device.iPhone -> iPhone
iPhone.printType() -> iPhone
```

```swift
enum Wearable {
  enum Weight: Int {
    case light = 1
    case heavy = 3
  }
  
  case helmet(weight: Weight)
  case boots
  
  func info() -> Int {
    switch self {
    case .helmet(let weight):
      return weight.rawValue * 2
    case .boots:
      return 3
    }
  }
}


let boots = Wearable.boots
boots.info()

var woodenHelmet = Wearable.helmet(weight: .light)
woodenHelmet.info() -> 2

var ironHelmet = Wearable.helmet(weight: .heavy)
ironHelmet.info() -> 6
```



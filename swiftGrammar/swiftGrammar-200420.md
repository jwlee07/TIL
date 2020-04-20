# OOP

## Class
```swift
 class <ClassName>: <SuperClassName>, <ProtocolName...> {
   <PropertyList>
   <MethodList>
 }
 
 let <objectName> = <ClassName()>
 objectName.<propertyName>
 objectName.<functionName()>
```

#### Initialize
* 모든 저장 프로퍼티에 초기값이 설정되어 있지 않은 경우
* 객체 생성시 단순히 ClassName( )만으로 생성 가능

```swift
init () {
	property = value
}

let objName = className()
```

-----


## Property


#### Stored
```siwft

class StoreProperry {
	var width = 0.0
	var height = 0.0
}
```

#### Lazy
* 외부 요인에 의존 할 때
* 복잡하거나 계산 비용이 많이 드는 설정 시
* 필요한 경우 제한적일 경우
* 한번 결과 값 저장 시 변경되지 않음

```
class LazyStoreProperty {
	var width = 10.0
	var height = 20.0
	
	lazy var area = width * height
}

let lazyStored1 = LazyStoredProperty()
lazyStored1.area -> 200
lazyStored1.width = 40
lazyStored1.area -> 200
```

#### Computed
* 호출 시 계산
* 입력이 있는 경우 set 사용

```swift
var <variable name>: <type> {
    get {
        <statements>
    }
    set {
        <variable name> = newValue
    }
}
  
private var _koreanWon = 0.0
var wonToDollar: Double {
  get {
    return _koreanWon / 1136.5
  }
  set {
    _koreanWon = newValue
    }
    
computed.wonToDollar -> 0
computed.wonToDollar = 10000
computed.wonToDollar -> 0.878768
```

#### Observer
* 변경되는 시점 willSet <-> didSet
```swift
var <variable name>: <type> = <value> {
    willSet {
        <statements>
    }
    didSet {
        <statements>
    }
}
```

#### Type
* 클래스에서만 사용 가능
* static : override 불가
```swift
static let(var) <propertyName>: <Type>
class var <propertyName>: <Type> { return <code> }
<TypeName>.<propertyName>
 
class TypeProperty {
  static var unit: String = "cm"
  var width = 5.0
}

let square = TypeProperty()
square.width

TypeProperty.unit
print("\(square.width) \(TypeProperty.unit)") -> 5.0cm
```

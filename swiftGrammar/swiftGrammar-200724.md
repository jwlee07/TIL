# Initializer

- Swift의 객체는 사용하기 전 모든 저장 프로퍼티에 대해 초기화 필수
	- 초기값 지정
	- 옵셔널 타입 -nil 값으로 초기화
	- 초기값이 없고, 옵셔널 타입이 아닌 프로퍼티에 대해서는 초기화 메서드에서 설정

```swift
class Circle {
	var desc: String?
	var radius: Int = 20
	var xCoordinate: Int
	var yCoordinate: Int
	
	init() {
	var xCoordinate = 5
	var yCoordinate = 10
	}
}
```

## Designated Initializer (지정 생성자)

- 클래스에 반드시 1개 이상 필요
- 초기화가 필요한 모든 프로퍼티를 단독으로 초기화 가능한 Initializer
- 위에서 사용한 init(), init(height: Int, xPosition: Int)가 여기에 해당
- 초기화 과정에서 반드시 한번은 호출

## Convenience Initializer (편의 생성자)
- 단독으로 모두 초기화할 수 없고 일부만 처리한 뒤 다른 생성자에게 나머지 부분 위임
- 중복되는 초기화 코드를 줄이기 위해 사용

```swift
class Rectangle {
	var width: Int
	var height: Int
	var xPosition: Int
	var yPosition: Int
	var cornerRadius: Int
	init() {
		// Designated Initializer
		width = 20
		height = 20
		xPosition = 10
		yPosition = 10
		cornerRadius = 5
	}
	
	convenience init(xPosition: Int) {
	// Convenience Initializer -> Designated Initializer -> overwrite
		self.init()
		self.xPosition = xPosition
	}
	convenience init(width: width, height: height, cornerRadius: cornerRadius) 
	// Convenience Initializer -> Designated Initializer
	self.init(width: width, height: height, xPosition: 10, yPosition: 30, cornerRadius: cornerRadius)
	}
}
```

- 초기화 과정은 (Convenience -> Convenience -> ... ->) Designated (최종) 순서로 동작

## Failable Initalizer

- 인스턴스 생성 시 특정 조건을 만족하지 않으면 객체를 생성하지 않는 것
- 생성이 되면 옵셔널 타입을 반환하게 되며, 생성 실패시에는 nil 반환

```swift
class Person {
	let name: String
	let age: Int
	
	init?(name: String, age: Int) {
	guard age > 0 else {return nil}
	self.name = name
	self.age = age
	}
}

// Faild
if let person = Person(name: "jinwook", age: -5) {

}
```

## Super Class Initializing

![Initializer_0](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Initializer/Initializer_0.png)

- 서브 클래스는 자기 자신 이외에 수퍼 클래스의 저장 프로퍼티까지 초기화 해야 한다
- 서브 클래스는 수퍼 클래스의 지정 생성자 (Designated Initializer) 호출 필요 (Convenience는 호출 불가)
- 수퍼 클래스의 지정 생성자가 기본 init 함수 하나만 있을 경우는 별도로 작성하지 않아도 자동으로 super.init() 메서드 호출
- 생성자가 여러 개인 경우, 어떤 초기화 메서드를 선택해야 할지 알 수 없으므로 선택해주지 않으면 오류
이 때는 서브 클래스에서 수퍼 클래스의 생성자를 명시적으로 선택해주어야 함
편의 생성자 (Convenience Initializer)는 무관

```swift
super.init() // 자식 클래스에서 실행
```
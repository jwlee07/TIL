## Access Control

* 다른 모듈의 코드 또는 다른 소스 파일 등으로 접근 제한 하는 것
* 세부 구현 내용을 숨기고 접근할 수 있는 인터페이스 가능
* Class, Property 별도로 생각

#### Open / Public
* another playground, project 
* open : 상속 후 override 가능

#### Internal
* 프로젝트, 모듈 안에서 사용 가능
* 기본 값 (생략)

#### Fileprivate
* 선언 한 File 내에서 접근 가능
* Property 생성 시 최소 FIleprivate 이상 레벨 타입 설정
* Class 인스턴스 시 변수에 Fileprivate 설정 필요

#### Private
* 선언 한 곳(ex. func) 안에서만 접근 가능
* Class 인스턴스 시 변수에 Private 설정 필요

#### Nested Type
```
Class -> Property

Private  ->  Fileprivate
Fileprivate  ->  Fileprivate
Internal  ->  Internal
Public  ->  Internal
Open  ->  Internal
```

#### Getters && Setters
*  Getter 와 Setter 는 그것이 속하는 변수, 상수 등에 대해 동일한 접근 레벨을 가짐 이 때 Getter 와 Setter 에 대해서 각각 다른 접근 제한자 설정 가능
*  Getter 와 Setter 에 대해 각각 명시적으로 표현


-----


## OOP 4대 특징

#### 추상화 (디자인)
* 단순화 시키는 것 
* 공통점만 취함
* 중요한 부분을 강조
* Protocol 사용
```swift
protocol Human {
  var name: String { get }
  var age: Int { get }
  var gender: String { get }
  var height: Double { get }
  
  func sleep()
  func eat()
  func walk()
}


class User: Human  {
	안의 고정적으로 입력해야할 프로토콜에서 선언하였던 값들이 생성
}
```

#### 캡슐화 (구현)
* 데이터 캡슐화 : 연관된 상태와 행동을 하나의 단위(객체)로 캡슐화
* 은닉화 : 외부에 필요한 것만 알리고 불필요하거나 감출 정보는 숨김
* 접근 제한자(private) 사용

#### 상속성
* 부모 클래스의 특징을 다른 클래스가 물려받아 그 속성과 기능을 동일하게 사용하는 것
* 범용적인 클래스 작성 뒤 중복되는 속성과 기능을 쉽게 구현
* final 상속 x
* 상속 받은 클래스의 프로퍼티를 override해서 사용 가능


#### 다형성
* Overriding 
	* 상위 클래스에서 상속 받은 매서드를 하위클래스에서 재정의 후 사용
	* 동일 요청이 객체에 따라 다르게 응답

* Overloading
	* 동일한 이름의 메서드가 매개 변수의 이름, 타입, 개수 등의 차이에 따라 다르게 동작

* super. -> 부모클래스 호출



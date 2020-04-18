## Class

* 상속 개념
* override : 상속받은 내용을 변경 하는 것 
* 참조 : 어디서 접근하여 값을 변경하던 공통되게 변경 ( 값은 1개, 참조하는 Class들은 그 1개를 바라 봄) -> Class에서만 가능
```swift
class ScoreBoard {
	var homeScore = 0
	var awayScore = 0
	func result() -> String {
		return "\(homeScore)" + " : " + "\(ayauScore)"
	}
}

// 상속
class Tennis: ScoreBoard {

}

var tennis = Tennis()
tennis.awayScore = 0
tennis.homeScore =15
tennis.result() -> 15:5

// override ( : -> - 로 변경)
class Soccer: ScoreBoard {
	override func result() -> String {
		return ""\(homeScore)" + " - " + "\(ayauScore)"
	}
}

// 참조 
var socer = Socer()
var socer2 = socer

socer2.homeScore = 10
scoer.hoemScore -> 10 (socer2에서 homeScore의 값을 변경하였지만 Soccer의 값 homeScore 변경되어 참조 시 변경한 값으로 참조 )
```


## Properties
* Class, struct, enum
* Stored Properties : 값이 저장된 형태
* Computed Properties : 계산을 직접 넣어서 특정한 로직이 들어가 있는 형태
	* get만 선언 시 read-only (입력 x)
	* set 값을 입력 받아야 하는 경우
```swift
class SomeClass {
	var firstScore = 10
	var secondeScore = 20
	//var totalScore = firstScore + secondSocer -> X
		var totalScore: Int {
			get {
				return firstScore + secondScore
			}
			/* // 생략
			set {
			}
			*/
		}
	}
}


struct SomeStruct {
	var firstScore = 10
	var secondScore = 20
	
	var totalScore: Int {
		get {
			return firstScore + secondScore
		}
		/* // 생략
		set {
		}
		*/
	}
}


enum SomeEnum {
	case iPhone, iPad
	
	var price: Int {
		switch self {
		case .iPad:
			return 500
			
		case .iPhone:
			return 400
		}
	}
}
```


## Initialization

* 초기화
* 옵셔널 사용 시 초기화 x
```swift

struct and class Score {
	var homeTeamScore: Int -> 초기화 값 x
	var homeTeamScore: Int -> 초기화 값 x
	
	// 초기화
	init () {
		homeTeamScore = 0
		awayTeamScore = 0
	}
	
	func totalScore() -> Int {
		return homeTeamScore! + awayTeamScore!
	}
}
```


## Deinitilization

* 초기화 해제
* 실행(class,struct,enum) 해제되는 순간에 실행 해야됨.
* ex. 팝업
```swift
class Score {
	init() {
		print ("생성되는 시점에 호출")
	}
	deinit {
		print ("소멸되는 시점에 호출")
	}
}

// 생성
var myScore = Score()
myScore

출력.
생성되는 시점에 호출

// 해제
var myScore: Score? = Score()
myScore = nil

출력.
nil
```


## Extension

* 기존의 class, struct 등 구조에 기능을 추가하기 위해 사용
* 값을 새로 구성할 순 없다
* 어디서도 접근가능 하나 어느 곳에 소유될 순 없다

```swift
extension UIcolor {
	var mainRedColor: UIColor {
		return UIColor(red: 230/255, green: 50/255, blue: 70/255, alpha: 1)
			var subGreenColor: UIColor {
		return UIColor(red: 100/255, green: 240/255, blue: 70/255, alpha: 1)
	}
}


var titleColor: UIColor!
var descriptionColor: UIColor!

titleColor = UIColor().mainRedColor
descripionColor = UIColor().subGreenColor
```


## Protocol
* 특정한 조건을 강제
* 앱 생성 시 call back 형식으로 많이 사용
* 특정한 값이 저장, 지정되는 것이 아닌 스타일(규격)만 지정
* protocol안의 코드는 반드시 구현해야 함
* 한 구조에 중복해서 사용 가능

```swift
protocol DeskSize {
	var width: Int {get set}
	var height: int {get set}
	
	func area() -> Int
}


class MyClass: DeskSize {
	var width: Int = 0
	var height: Int = 0
	func area() -> Int {
		return width * height
	}
	
var myClass: MyClass()
myClass.width = 20
myClass.height = 30
myClass.area() = 600
}
```


## Generic
* 타입을 사용할 때 정의 (각 상황에 따라 변경 가능)
* Numeric : 숫자형식의 모든 타입 가능

```swift

func plusGeneric<T: Numeric>(a: T, b: T) -> T { return a+ b}

var result = plusGeneric (a: <Int,Double,Float 가능> , b: <Int, Double, Float 가능>)
result 
```


## Higher Order Func

* Map
	* 옵셔널 상태 유지
```swift
let numberArray = [1,2,3,4,5]
let mapped = numberArray.map {$0 * 10}

print(mapped) -> [10,20,30,40,50]

let stringArray = ["lee", "june", "kim"]
let mappedString = stringArray.map {$0. uppercased()}

print (mappedString) -> ["LEE", "JUNE", "KIM"]
```

* Complact Map
	* 옵셔널 상태 해제
```swift
let someArray: [Any] = [2,3,4,"lee","jin"]
let compactMapped = someArray.compactMap { $0 as? Int}

print(compactMapped) -> 2,3,4
```

* Filter

```swift
let numberArray = [1,2,3,4,5]
let over3 = numberArray.filter{ $0 > 3}

print(over3) -> 4.5
```

* Reduce
	* 해당 변수 (Array 등) 의 결과 값 출력 시
```swift
let numberArray = [1,2,3,4,5]

let reduceResult = numArray.reduce(0) { $0 + $1}
print (reduceResult) -> 15
```

* Sort
	* sroted : return type (해당 값 별개로 정렬된 값 생성)
	* sort : void ( 해당 값 자체를 정렬)

```swift
let numberArray = [1,2,3,4,5]

let numberArraySorted = numberArray.sroted()
numberArray.sort()
```

## Typealias
*	기존 타입의 이름을 바꿔서 새로운 타입을 만드는 개념
*	기존타입을 조합해서 새로운 타입을 만들수도 있음.
```swift
typealias SampleRate = Uint
var myMusic: SampleRate = 10

typealias GridPoint = (x: int,y: int)
var touchPoint: GridPoint = GridPoint(10,40)
print (touchPoint.y) -> 40
```



-----



## Operator
*	기초 연산
```swift
let aa == false
aa -> false
!aa -> true

//삼항연산자
a == b ? print("같다") : print("다르다")

//??
var aa : int?
print (aa) -> nil
print (aa ?? 0) -> 0

// for
for index in 0...5{
	print("반복 \(index)")
}

let myArray = ["a", "b", "c", "d"]

for index in 0..<myArray.count{
	print("반복 \(myArray[index])")
}

for myValue in myArray[0...]{
	print("Array 값 : \(myValue)")
}
```



-----



## Optional



### Optional_1
*	Expression : ?
*	Optional Type에서의 값은 사용 불가 Unwrap 후 사용 가능
```swift
var myString: [Type]? -> nil
myString = nil -> nil

var myString2: String = String.init() -> ""
myString2 = nil -> error
```

### Optional_2
*	Unwrapping : Optional을 벗겨내는 형태
*	Force-Unwrap : ! (사용 시 nil check logic 무조건 필요 !)
*	Optional Binding : if let (nill check 자동 지원)
*	Optional Chaining : 구조가 복잡할 시 사용
```swift
// Force-Unwrap
var mySocre: Int?
if myScore == nil{
	print("nil")
}else mySocre! < 100 {
	print("has score")
}

// Binding
if let hasScore = myScore{
	if hasScore <50{
		}
}

//Chaining
class People{
	var score: Score?
}
class Score{
	var testName: String?
}
var people = People() -> init
if let people.score?.testName == nil{

}
```

### Nil_Coalescing_Operator
*	Nil 병합 연산자
```swift
var myName: String?

print(myName) -> nil
print(myName ?? "jwlee") -> jwlee

if myScore ?? 0 < 50{
	print ("값이 없으면 0으로 사용")
}
```



-----



## Collection Type


### Array
* 배열 :  [ ]
* ( ) -> initialization
* must be check Index out of range 
```swift
var someList = Array<Type>()
var somStrings = [Type]()

someStrings.append
	apppend(contentsOf. Seq) -> Another Array
	apppend(newElement. Type) -> 해당 변수의 Array Type 하나의 원소 값 
	
someStrings.append ("jwlee")
someStrings.append ("Hello")
someStrings.append ("123")
// someStrings.append (123) -> error

print (someStrings) -> ["jwlee", "Hello", "123"]

somStrings.remove(at: 1)

print (someStrings) -> ["jwlee", "123"]

// check Index out of range
if SomeStrings.count - 1 >= removeIndex{ 
	someStrings.remove(at: removeIndex)
}
```

### Set
*	Hashable - String, Int, Double, Bool
*	집합 개념.
* list 값 순서(x)
```swift
var strings = Set<type>()
strings.insert("jwlee")
strings.insert("Hello")
print (strings) -> ["jwlee", "Hello"]

strings.remove("jwlee")
print (strings) -> ["Hello"]
```

*	function 
	*	union : 합집합 
	*	intersection : 교집합 
	*	symmetricDifference : 배타적 교집합 (ExclusiveOR)
	*	subtracting : 차집합
```swift
var strings2 = Set<type>()
var strings3 = Set<type>()

strings2.insert("j")
strings2.insert("w")
strings2.insert("l")

strings3.insert("1")
strings3.insert("2")
strings3.insert("w")

print (strings2.union(strings3)) -> ["j", "1", "w", "l", "2"]
print (strings2.intersection(strings3)) -> ["w"]
print (strings2.symmetricdifference(strings3)) -> ["j", "1", l", "2"]
print (strings2.subtracting(strings3)) -> ["j", "l"]
```

### Dictionary
*	Key : Value
*	값 순서(x)

```swift
var variable = [Type : Type or Any]()

var sports = [String : Any]()
sports["soccer"] = "korea"
sports["baseball"] = 7
sports["football"] = false

print (sports) -> ["soccer" : "korea", "football" : false, "baseball" : 7]

sports.count -> 3
print(sports["soccer"]) -> Optional("korea")
```



-----



## For-in (Loop)
*	Collection Type 순차적 확인
* for element in Array{ }
*	_ : 요소에 접근 x


### Array
```swift
var names = ["jwlee", "bin", "wook"]
for element in names{
	print (element) -> jwlee, bin, wook
}
```

### Dictionary
```swift
var people = ["jwlee" : 26, "bin" : 29]
for element in people{
	element.key -> "jwlee", "bin" 접근
	element.value -> 26, 29 접근
}

for index in 0..<people.count{
	print (index) -> 0 1 
}
(0..<people.count).revers() -> 반대로
```



-----



## Switch
*	범위 : 숫자...(<, <=, >, =>)숫자
```swift
switch value{
case pattern:
	code
default:
	code (break)
}

```



-----



## Function


### Function_1
*	함수 : 기능 생성
*	호출하는 개념
```swift
func variable(parameter: Type, parameter: Type) -> Type {
	return code 
}

var variable(parameter: argument,parameter: argument)
print (Variable)
```

### Function_2
*	파라미터 사용 3가지 방법
```swift
func sum(number1: Int, number2: Int) -> Int{
	return number1 + number2
}
var result = sum(number1: 10, number: 20)


func sum2(_ number1: Int, _ number2: Int) -> Int{
	return number1 + number2
}
var result = sum2(10, 20)


func sum3(num1 number1: Int, num2 number2: Int) -> Int{
	return number1 + number2
}
var result = sum3(num1: 10, num2: 20)
```

### Function_3
*	파라미터 가변인자 (Array Type) 
*	return 여러개 출력
```swift
func sumAll(numbers: Int...) -> Int{
	var total = 0
	for number in numbers{
		total += number
	}
return total
}

func sum(_ num1: Int, _ num2: Int) -> (int, int, int) {
	return (num1, num2, num1 + num2)
}
var sumResult = sum(20,40)
print (sumResult.1) -> 40
```



-----



## Closure


### Closure_1
* 기본 구조
```swift
var = variable {(parameters) -> return type in
	statements
}
```

### Closure_2
*	Type inference
*	Implicit return : Single-express closure
*	Shortand Argument Names : $
```swift
var sayGreet = {(firstName: String, lastName: String) -> String in return "\(firstName + lastName) Hello"}

sayGreet("Jin", "Wook") -> "jinWook Hello"


// Type inference
var sayGreet2 = {(firstName: String, lastName: String) 
	in "\(firstName + lastName) Hello"}

sayGreet("Jin", "Wook") -> "jinWook Hello"


// Implicit return & Shortand Argument Names
var sayGreet3: (String, Sting) -> String = {$0 + $1} 

sayGreet3("Jin", "Wook") -> "jinWook"
```

### Closure_3
*	특정한 조건, 상태를 Closure로 사용하기에 적합
*	실행 부분에서 조건 확인 가능
```swift
var name = ["apple", "lemon", "brown", "red", "band", "candy"]

func filterClosure(datas: [String], clousere: (String) -> Bool ) -> 
	var newDatas = [String]()
	for data in datas{
		if closure(data) == true {
			newDatas.append(data)
		}
	}
return newDatas{
}

let filtered = filterClosure (datas: name) {(element) -> Bool in
	if element.first?.description == "a'{
		return true"
	}
	return fals es
}

var findword: (String) -> Bool = { element in
	if element.first?.description == "a"{
		return true
	}
	return false
}
```

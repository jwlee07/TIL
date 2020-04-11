# Swift Grammar

## Basic 1

## Comment 

### 디버그 영역 정보을 위한 함수
```swift
var num = 1
print (num)
print("숫자 \(name)")
print("숫자"+String(num))
```

### 주석
* // : 한 줄 주석 (Command + /)
* /// : 한 줄 주석 + Quick Help Markup  (Command + Option +  /)
* /* */ : 멀티 라인 주석

### 세미콜론(;)
* 한 라인에 다중 명령 사용 시 사용
```swift
print(1); print(2); print(3);
```



-----



## Constants(상수) , Variables(변수)
```swift
let num = 1
let num = 10 (x)

var num = 1
var num = 10 (o)
```

*	네이밍, 네이밍 컨벤션, 선언 순서 확인

### 네이밍
```swift
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
let 한글 = "세종대왕"
let `let` = 1   // Swift 에서 사용되는 키워드일 경우 backquote(`) 를 이용해 사용 가능

print(π)
print(你好)
print(한글)
print(🐶🐮)
print(`let`)
```

*	유니코드 문자를 포함한 대부분 문자 사용 가능

 

-----



## Type

### Type 지정
```swift
let year: Int = 1995
let language: String
language = "jwlee"

var apple, banana, ,melon: Double
red = 255.0
green = 150.123
blue = 75
```

*	변수 선언 시 사용 될 자료 타입 명확히 지정

### Type 추론
```swift
let name: String = "jwlee"
type(of: name) // String

let age: Int = 4
type(of: age) // Int

var weight = 10.4
type(of: weight) // Double

var love = true
type(of: love) // Bool
```



-----



## Literals
*	소스코드에서 고정된 값으로 표현되는 문자

### Numeric 
```swift
var signedInteger = 123
signedInteger = +123
signedInteger = -123
type(of: signedInteger) -> Int.Type

10진수
let decimalInteger = 17
2진수
let binaryInteger = 0b10001
type(of: binaryInteger)
8진수
let octalInteger = 0o21
16진수
let hexadecimalInteger = 0x11

var bigNumber = 1_000_000_000
```

*	8-bit : Int8, UInt8
*	16-bit : Int16, UInt16
*	32-bit : Int32, UInt32
*	64-bit : Int64, UInt64

### Overflow
```swift
var add: Int8 = Int8.max &+ 1 -> -128

Int8.max &+ 1 -> -128
Int32.max &+ 1 -> -2147483648
Int64.max &+ 1 -> -92233729368...
```

### Floationg-point
```swift
MemoryLayout<Float>.size -> 4
Float.greatestFiniteMagnitude
Float.leastNormalMagnitude

MemoryLayout<Double>.size -> 8
Double.greatestFiniteMagnitude
Double.leastNormalMagnitude
```
*	 Double - 최소 소수점 이하 15 자리수 이하의 정밀도
*	  Float - 최소 소수점 이하 6 자리수 이하의 정밀도

### Typealias
```swift
typealias Name = String

let name: Name = "jwlee"
let nameString: String = "jwlee"

type(of: name) -> String.Type
type(of: nameString) -> String.Type
```

*	기존 타입의 이름을 참조하여 사용하고 싶을 경우



-----



## Basic Operators

### Terminology
```swift
Unary Operator (단항 연산자)
-a
Prefix (전위 표기법)
-a
Postfix (후위 표기법)
c!
Binary Operator (이항 연산자)
a + b
Infix (중위 표기법)
a + b

Ternary Operator (삼항 연산자) -> only one
a > 0 ? "positive" : "zero or negative"
```

### Assignment 
```swift
var value = 0
value = value + 10
value = value - 5
value = value * 2
value = value / 2
value = value % 2

value += 10
value -= 5
value *= 2
value /= 2
value %= 2

미지원 : value++ , value--
```

### Comparison 
```swift
Equal to operator
a == b

Not equal to operator
a != b

Greater than operator
a > b

Greater than or equal to operator
a >= b

Less than operator
a < b

Less than or equal to operator
a <= b
```

### Logical
```swift
Logical AND Operator
true && true
true && false
false && true
false && false

Logical OR Operator
true || true
true || false
false || true
false || false

Logical Negation Operator
!true
!false
```

### Range
```swift
Closed Range Operator
0...100
0...100.reversed() -> 반대로 출력

Half-Open Range Operator
0..<100

One-Sided Ranges
1...
...100
..<100
```



-----



## Function

*	일련의 작업을 수행하는 코드 묶음을 식별
*	유형
	*	Input (o) Output (o)
	*	Input (x) Output (o)
	*	Input (o) Output (x)
	*	Input (x) Output (x)
```swift
 func <functionName>(<parameterName>: <Type>) -> <ReturnType> {
   <statements>
```

### Example


#### Without Parameters
```swift
func hello1() {
	print("Hello, world!")
}
```

#### Without Return Values
```swift
func say(number: Int) {
	print(number)
}
```

#### Params and Return Values
```swift
func addNumbers(a: Int, b: Int) -> Int{
	return a + b
}

func greet(person: String) -> String {
	let greeting = "Hello, " + person +"!"
}
```

#### Omit Return
```swift
func addTwoNumbers(a: Int, b: Int)->Int {a + b} -> return a + b와 동일
```

#### Argument Lavel
```swift
func functionName(parameterName: Type) {}
func functionName(argumentName parameterName: Type) {}

func multiplyNumber(lhs num1: Int, rhs num2: Int) {
	num1 + num2
}
multiplyNumber(lhs: 10, rhs: 10)

func someFunction(_ first: Int, second: Int) {
	print(first, second)
}
someFunction(1, second: 2)
```

#### Default Parameter Values
```swift
func functionWithDefault(param: Int = 12) -> Int {
	return param -> 12

```

#### Variadic Parameters
```swift
func arithmeticAverage(_ numbers: Double...) -> Double {
	var total = 0.0
	for number in numbers {
	total += number
  }
  return total / Double(numbers.count)
}
arithmeticAverage(1, 2, 3) -> 2

_ numbers: Double... -> Double 타입 가변인수
```

#### Nested Functions
*	내부에서만 사용할 함수 중첩
```swift
func chooseFunction(plus: Bool, value: Int) -> Int {
	func plusFunction(input: Int) -> Int { input + 1 }
	func minusFunction(input: Int) -> Int { input - 1 }
  
	if plus {
		return plusFunction(input: value)} 
	} else {
		return minusFunction(input: value)
  }
```

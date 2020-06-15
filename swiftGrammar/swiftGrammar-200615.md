## Higher-order Function

### 고차함수

```swift
하나 이상의 함수를 인자로 취하는 함수
함수를 결과로 반환하는 함수
```

### 1급 객체

```swift
변수나 데이터에 할당할 수 있어야한다
객체의 인자로 넘길 수 있어야 한다
객체의 리턴값으로 리턴할 수 있어야 한다
```

### forEach
* 컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태

```swift
// 배열의 값을 print
let immutableArray = [1, 2, 3, 4]

immutableArray.forEach {print($0)}

func printParam(_ num: Int) {print(num)}

immutableArray.forEach(printParam(_:))
print()
```

### map
* 컬렉션의 각 요소(Element)에 동일 연산을 적용하여, 변형된 새 컬렉션 반환

```swift
// 배열의 값에 *2

let numArr2 = [1,2,3,4,5,6,7,8,9]
let numSum = numArr2.map {$0 * 2}
```

### filter
* 컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환

```swift
// 배열의 값에 "Bob"가 포함된 것만 반환

let names = ["Chris", "Alex", "Bob", "Barry"]
names.filter { $0 == "Bob"}
```

### reduce
* 컬렉션의 각 요소들을 결합하여 단 하나의 타입을 지닌 값으로 변환 (ex. Int, String)

```swift
 (1...100)
   .reduce(<initialResult: Result Result>, <nextPartialResult: (Result, Int) throws -> Result(Result, Int) throws -> Result>)
 
 Result Type - 결과로 얻고자하는 값의 타입
 
 initialResult - 초기값
 nextPartialResult - (이전 요소까지의 결과값, 컬렉션이 지닌 현재 요소)

print((1...100).reduce(0) { $0 + $1 })

// 0 + 1 = 1
// 1 + 2 = 3
// 3 + 3 = 6
// 6 + 4 = 10
// ....
```

### compactMap
* 컬렉션의 각 요소(Element)에 동일 연산을 적용하여 변형된 새 컬렉션 반환
* 옵셔널 제거

```swift
// nil값이 제거가 된 후 반환
let optionalStringArr = ["A", nil, "B", nil, "C"]
optionalStringArr.compactMap { $0 }
```

### flatMap
* 중첩된 컬렉션을 하나의 컬렉션으로 병합

```swift
// 2중 배열을 1중 배열로 변환
let nestedArr: [[Int]] = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]

print(nestedArr.flatMap { $0 })
-> [1, 2, 3, 9, 8, 7, -1, 0, 1]
```
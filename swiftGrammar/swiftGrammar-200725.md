# CustomLogging

- 프로그램에서 로그의 정의는 애플리케이션 상태 또는 내부 로직의 흐름을 관찰할 수 있도록 출력한 정보를 의미합니다.콘솔 로그(Console Log)는 디버깅 중 디버깅 콘솔에 보여줄 로그를 뜻합니다.
- 스위프트에서는 print( ), debugPrint( ), dump( ) 함수를 사용하여 콘솔 로그를 출력할 수 있습니다.
- 아래는 Custom 하지 않은 기본 함수를 사용하여 출력한 결과 입니다.

```swift
let arr = (1...10)

let hello = "Hello, Jinwook"
  
class JwleeClass {
  let name = "jinwook"
  let age = 26
  let feature: [String: String] = [
    "height": "184cm",
    "weight": "83kg"
  ]
}
```

### Print

```swift
1...10
Hello, Jinwook
CustomLogging.JwleeClass
```

### debugPrint

```swift
ClosedRange(1...10)
"Hello, Jinwook"
CustomLogging.JwleeClass
```

### dumb

```swift
▿ ClosedRange(1...10)
  - lowerBound: 1
  - upperBound: 10
- "Hello, Jinwook"
▿ CustomLogging.JwleeClass #0
  - name: "jinwook"
  - age: 26
  ▿ feature: 2 key/value pairs
    ▿ (2 elements)
      - key: "weight"
      - value: "83kg"
    ▿ (2 elements)
      - key: "height"
      - value: "184cm"
```

## CustomStringConvertible

- 자신이 얻고 싶어하는 콘솔로그를 커스텀하게 설정한다.

```swift
class JwleeClass: CustomStringConvertible {
  let name = "jinwook"
  let age = 26
  let feature: [String: String] = [
    "height": "184cm",
    "weight": "83kg"
  ]
  var description: String {
    return "JwleeClass's name: \(name), age: \(age)"
  }
}
```

### Consol Log

```
print
JwleeClass's name: jinwook, age: 26
====================
debugPrint
JwleeClass's name: jinwook, age: 26
====================
dump
▿ JwleeClass's name: jinwook, age: 26 #0
  - name: "jinwook"
  - age: 26
  ▿ feature: 2 key/value pairs
    ▿ (2 elements)
      - key: "height"
      - value: "184cm"
    ▿ (2 elements)
      - key: "weight"
      - value: "83kg"
```

## CustomDebugStringConvertible

- print를 제외한 debugPrint, dump의 콘솔 로그 반환값 설정을 주고 싶을데 사용한다.

```swift
class JwleeClass: CustomStringConvertible, CustomDebugStringConvertible {
  
  let name = "jinwook"
  let age = 26
  let feature: [String: String] = [
    "height": "184cm",
    "weight": "83kg"
  ]
  var description: String {
    return "JwleeClass's name: \(name), age: \(age)"
  }
  var debugDescription: String {
    return "JwleeClass's name: \(name), age: \(age), feature \(feature)"
  }
}
```

### Consol Log

```
print
JwleeClass's name: jinwook, age: 26
====================
debugPrint
JwleeClass's name: jinwook, age: 26, feature ["weight": "83kg", "height": "184cm"]
====================
dump
▿ JwleeClass's name: jinwook, age: 26, feature ["weight": "83kg", "height": "184cm"] #0
  - name: "jinwook"
  - age: 26
  ▿ feature: 2 key/value pairs
    ▿ (2 elements)
      - key: "weight"
      - value: "83kg"
    ▿ (2 elements)
      - key: "height"
      - value: "184cm"
```

## NSLog

- object-c 에서 사용되던 Consol Log 
- CustomStringConvertible, CustomDebugStringConvertible는 이미 상속을 받은 상태여서 사용할 필요가 없다.

```swift
lass JwleeClass: NSObject {
  
  let name = "jinwook"
  let age = 26
  let feature: [String: String] = [
    "height": "184cm",
    "weight": "83kg"
  ]
  override var description: String {
    return "JwleeClass's name: \(name), age: \(age)"
  }
  override var debugDescription: String {
    return "JwleeClass's name: \(name), age: \(age), feature \(feature)"
  }
}

NSLog("%@", JwleeClass)
```

### Consol Log

```
2020-07-25 16:46:51.541639+0900 CustomLogging[31597:989003] JwleeClass's name: jinwook, age: 26
```

## SpecialLiterals

- File : (String) 파일 이름
- Funcction : (String) 함수 이름
- Line : (Int) 라인 넘버
- Culumn : (Int) 컬럼 넘버

```swift
   print ("File : ", #file)
   print ("Function : ", #function)
   print ("Lile : ", #line)
   print ("Cile : ", #column)
   
	print ("function :  \(#function) \nline : \(#line) \nhello : \(hello)")

```

### Consol Log

```
File :  /Users/jinwook/코딩공부/CustomLogging/CustomLogging/ViewController.swift
Function :  viewDidLoad()
Lile :  49
Cile :  23

function :  viewDidLoad() 
line : 52 
hello : Hello, Jinwook

```

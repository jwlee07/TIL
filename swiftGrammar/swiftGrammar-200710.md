# Error Handling

- 프로그램 동작 중 예상 가능한 오류가 발생했을 때 이를 감지하고 복구하기 위한 일련의 처리 과정

## What is Error

- Swift 에서 정의하는 심각도에 따른 4가지 유형의 오류
```
- simple domain error (단순 도메인 오류)
	- 명백하게 실패하도록 되어 있는 연산 또는 추측에 의한 실행 등으로 발생
- Recoverable (복구 가능한 오류)
	- 복잡한 연산을 수행하는 도중 실패가 발생할 수 있지만 사전에 미리 오류를 합리적으로 예측할 수 있는 작업
- Universal Error (범용적, 보편적 오류)
	- 시스템이나 어떤 다른 요인에 의한 오류
	- 이론적으로는 복구가 가능하지만, 어느 지점에서 오류가 발생하는 지 예상하기 어려움
- Logic Failure
	- Logic에 대한 오류는 프로그래머의 실수로 발생하는 것으로 프로그램으로 컨트롤할 수 없는 오류에 해당
```

## 4 ways to handle errors

- Propagating Errors Using Throwing Functions
- Handling Errors Using Do-Catch
- Converting Errors to Optional Values
- Disabling Error Propagation

## Propagating Errors

- 오류에 대한 처리를 코드의 다른 부분에서 처리하도록 throws 키워드를 명시적으로 선언
- throws 키워드가 없을 때는 오류를 해당 함수 내에서 처리해야 함

![ErrorHandling_1](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/ErrorHandling/ErrorHandling_1.png)

### throws function > non throws function

![ErrorHandling_2](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/ErrorHandling/ErrorHandling_2.png)

## HandLing Errors Using Do-Catch

![ErrorHandling_3](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/ErrorHandling/ErrorHandling_3.png)

### Catch Error

![ErrorHandling_4](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/ErrorHandling/ErrorHandling_4.png)

## Converting Errors to Optional Values

```
- try를 사용하여 do ~ catch 구문 없이 오류 처리 가능
- 정상 수행 시 Optional값 변환, 오류 발생 시 nil 반환
```

![ErrorHandling_5](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/ErrorHandling/ErrorHandling_5.png)

## Disabling Error Progagation

```
- do ~ catch 구문 없이 throws 메서드 처리 가능하지만 오류 발생 시 앱 Crash
- 오류가 발생하지 않는다고 확신할 수 있는 경우에만 try! 사용
```

![ErrorHandling_6](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/ErrorHandling/ErrorHandling_6.png)

## Specifying Cleanup Actions

```
- defer : 현재 코드 블럭이 종료되기 직전에 반드시 실행되어야 하는 코드 등록, 해당 범위가 종료될 때까지 실행을 연기하며 소스 코드에 기록된 순서의 역순으로 동작
```

![ErrorHandling_7](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/ErrorHandling/ErrorHandling_7.png)

## Error

```swift
public protocol Error { }

open class NSError: NSObject, NSCopying, NSSecureCoding {

}

extension NSError : Error {

}
```
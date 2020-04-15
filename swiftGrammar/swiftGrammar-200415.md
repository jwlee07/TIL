# swift Grammar

## Closure_4
* Closure : (  ) -> Type
* func <-> Clouser 사용
* 함수안의 또 다른 함수
```swift
// func
func greeting(name: String) -> String {
	return "hi " + name
}
greeting(name: "jin") -> hi jin


// func + closure
func greetingClosure (name: String) -> () -> String {
	return {"hi " + name}
}

greetingCloseure(name: "jin2") -> no output
greetingCloseure(name: "jin2")() -> jin2
```

## Enum
* 특정한 타입들의 묶음
* 텍스트를 쓰면서 error 방지
* 값을 사용할 시 조건문 사용 필요
```swift
enum MediaType {
	case picture(width: String, height:String)
	case movie(length: Int)
}

var media = MediaType.picture(width: "200", height "300")

switch media {
	case .picture(width: let width, height: let height) :
		print(width) -> 200
		print(height) -> 300
	default:
		break
}
```








import UIKit



/*
func addTwoValues(a: Int, b: Int) -> Int {
  return a + b
}
let task1: Any = addTwoValues(a: 2, b: 3)

위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것
task1 + task1
*/

func addTwoValues(a: Int, b: Int) -> Int {
  return a + b
}

let task1: Any = addTwoValues(a: 2, b: 3)

if let task1ChangeInt = task1 as? Int {
  let result = task1ChangeInt + task1ChangeInt
  print (result)
}


/*
let task2: Any = addTwoValues
과제 1번에 이어 이번에는 위와 같이 정의된 task2 변수에 대해
두 변수의 더하기 연산이 제대로 동작하도록 할 것
(addTwoValues의 각 파라미터에는 원하는 값 입력)

task2 + task2
*/

let task2: Any = addTwoValues(a: 3, b: 5)

if let task2ChangeInt = task2 as? Int {
  let result = task2ChangeInt + task2ChangeInt
  print (result)
}

/*
class Car {}
let values: [Any] = [
  1,
  99.9,
  (2.0, Double.pi),
  Car(),
  { (str: String) -> Int in str.count }
]

위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기

for value in values {
  switch value {
    // Code 구현
  }
}
*/
class Car {}
let values: [Any] = [
  1,
  99.9,
  (2.0, Double.pi),
  Car(),
  { (str: String) -> Int in str.count }
]

for value in values {
  switch value {
  case let int as Int:
    print (int)
  case let doubel as Double:
    print (doubel)
  case let tuple as (Double,Double):
    print (tuple)
  case let classCheck as Car:
    print (classCheck)
  case let closur as ((String) -> Int):
    print (closur)
  default:
    break
  }
}
 
 

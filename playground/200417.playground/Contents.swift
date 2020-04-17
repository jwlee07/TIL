import UIKit

//자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
//(1234 인 경우 각 자리 숫자를 합치면 10)


func numPlus (numInPut: Int) -> Int {
    let numString = String(numInPut)
    var numString2: String
    var numResult: Int = 0
    
    for index in numString {
        numString2 = String(index)
        numResult += Int(numString2)!
    }
    return numResult
}
numPlus(numInPut: 12345)


// 함수를 이용해 풀었던 문제를 클로저로 변형해서 풀어보기
// 클로저 Full Syntax <-> Optimized Syntax 변환 연습


// 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
let nameAge: (String,Int) -> String = {name, age in return "이름 : \(name) 나이 : \(age)"}
nameAge("jwlee", 26)

let nameAgeOpt: (String,Int) -> String = {"이름 : \($0) 나이 : \($1)"}
nameAgeOpt("jwlee", 26)

// 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
let numMul: (Int) -> Bool = {age in return age % 2 == 0}
numMul(3)

let numMulOpt = { $0 % 2 == 0}
numMul(2)

//정수를 두 개 입력 받아 곱한 결과를 반환하는 함수
let numTwoMul: (Int,Int) -> Int = {num1, num2 in return num1 * num2}
numTwoMul(3,4)

let numTwoMulOpt: (Int,Int) -> Int = { $0 * $1}
numTwoMulOpt(3,5)

// 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
let fourAverage: (Double, Double, Double, Double) -> Double = {num1, num2, num3, num4 in return (num1 + num2 + num3 + num4)/4}
fourAverage(78,86,90,88)

let fourAverageOpt: (Double, Double, Double, Double) -> Double = {($0 + $1 + $2 + $3)/4}
fourAverageOpt(98,78,67,98)
//세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
let threeNumMul: (Int, Int, Int) -> Bool = {num1, num2, num3 in return (num1 * num2 * num3) > 0}
threeNumMul(3,4,1)

let threeNumMulOpt: (Int, Int, Int) -> Bool = {($0 * $1 * $2) > 0}
threeNumMulOpt(3,4,1)

//자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
let twoNumMul: (Int, Int) -> Int = {
    number, numMax in
    var numResult: Int = 1
    for _ in 1...numMax{numResult *= number}
    return numResult
}
twoNumMul(3,4)

let twoNumMulOpt: (Int, Int) -> Int = {
    var numResult: Int = 1
    for _ in 1...$1{numResult *= $0}
    return numResult}
twoNumMulOpt(2,3)


// 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

// 1 (변경 전)
let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
  let isAscending: Bool
  if s1 > s2 {
    isAscending = true
  } else {
    isAscending = false
  }
  return isAscending
}

// 1 (변경 후)
let someClosureOpt: (String, String) -> Bool = {$0 > $1}
someClosureOpt("b","a")

// 2 (변경 전)
let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
  var count: Int = 0
  for _ in values {
    count += 1
  }
  return count
}

// 2 (변경 후
let otherClosureOpt: ([Int]) -> Int = {var count:Int = 0
    for _ in $0 {
        count += 1
    }
    return count
}
otherClosure([4,2,3,1,2,3,4])

// 기존 배열에서 추가된 배열에 필터링 한 글자가 속하는 값(스트링) 추가
let countryArr = ["korea", "japen", "america", "brazil", "france"]

func countryCheck (Arr: [String], closure: (String) -> Bool) -> [String]{
    var countryCheckArr = [String]()
    for index in Arr {
        if closure(index) {
            countryCheckArr.append(index)
        }
    }
    return countryCheckArr
}

let countryCheckAlpabetA: (String) -> Bool = {$0.contains("a")}
let countryCheckAlpabetB: (String) -> Bool = {$0.contains("b")}

countryCheck(Arr: countryArr, closure: countryCheckAlpabetB)

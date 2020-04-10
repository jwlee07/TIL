# Basic Swift

## Basic 1

### 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수

```swift
import UIKit

func person (_ name: String,_ age: Int) -> String{
        let personInfo = name + String(age)
        print ("이름 : \(name) 나이 : \(age)")
        return personInfo
}
person("jwlee",26)
```

### 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수

```swift
import UIKit

func twoMultiple (_ num: Int){
    let twoMultipleRes = num % 2
    if twoMultipleRes == 0{
        print ("2의 배수 입니다.")
    }
    else{
        print("2의 배수가 아닙니다.")
    }
}
twoMultiple(4)
```

### 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)

```swift
import UIKit

func calculator (_ num1: Int, _ num2: Int = 12){
    let result = num1 * num2
    print ("\(num1) * \(num2) = \(result)")
}
calculator(3,4)

// 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수

import UIKit

func subjectAverage (_ c: Int, _ java: Int, _ swift: Int, _ python: Int) -> Int{
    let result = (c + java + swift + python)/4
    print ("평균 점수 : \(result)")
    return result
    
}
subjectAverage(78, 56, 80, 92)
```

### 점수를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

```swift
import UIKit

func scoreClass (_ score: Int){
    switch score {
    case (90...100):
        print ("학점 : A")
    case (80...89):
        print ("학점 : B")
    case (70...79):
        print ("학점 : C")
    default:
        print ("학점 : F")
    }
}
scoreClass(86)
```

### 가변 인자 파라미터를 이용해 점수를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

```swift
import UIKit

func scoreClass (_ score: Int...){
    var total: Int = 0
    for scoreTwo in score {
        total += scoreTwo
    }
    let result = total / Int(score.count)
    switch result {
    case (90...100):
        print ("평균 학점 : A")
    case (80...89):
        print ("평균 학점 : B")
    case (70...79):
        print ("평균 학점 : C")
    default:
        print ("평균 학점 : F")
    }
}
scoreClass(77,65,95,87)
```

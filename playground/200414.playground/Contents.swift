//["p", "u", "p", "p", "y"] 라는 값을 가진 배열에서 마지막 "p" 문자 하나만 삭제하기

var chaArray = ["p", "u", "p", "p", "y"]
let removechaArray = chaArray.remove(at: 3)
chaArray

// 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
   
var num1Array = [1, 2, 4, 8, 9, 12, 13]
var num2Array = [2, 5, 6, 9, 13]
var num3Array: [Int] = []
for num1 in num1Array {
    for num2 in num2Array {
        if num1 == num2 {
            num3Array.append(num1)
        }
    }
}
num3Array

// Dictionary 로 저장되어 있는 시험 성적의 평균 점수 구하기 (ex.  ["kor": 92,"eng": 88, "math": 96, "science": 89])
   
func averageDic () -> Double {
    let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
    var result: Double = 0
    var scoresSum = 0
    for value in scores.values {
        scoresSum += value
        result = Double(scoresSum / scores.count)
    }
    return result
}
 
// Dictionary로 저장된 scores 데이터를 튜플 타입을 지닌 배열로 변환하여 저장하기 (ex. let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89])
   
    var scoreArray: [(String,Int)] = []
    let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
    var stringKey = " "
    var stringValue = 0
    for (key, value) in scores {
        stringKey = key
        stringValue = value
        scoreArray.append((stringKey,stringValue))
    }

 


// [보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
// 위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고 스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
   
func personFruit () -> [String] {
    let dicMatching = ["철수":"apple", "영희":"banana", "진수":"grape", "미희":"strawberry"]
    var person = [String]()
    for (key,value) in dicMatching {
        if value.contains("e") {
            person.append(key)
        }
    }
    return person
}
personFruit()
 


// 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수 (ex. [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4])
   
func arraySort () -> [Int] {
    let firstNum = [2, 8, 7, 1, 4, 3]
    var numCount = 0
    var sortNum: [Int] = []
    for index in firstNum {
        if !(index % 2 == 0) {
            sortNum.insert(index, at: numCount)
            numCount += 1
        } else {
            sortNum.append(index)
        }
    }
    return sortNum
}
arraySort()
 


// 0 ~ 9 사이의 숫자가 들어있는 배열에서 각 숫자가 몇 개씩 있는지 출력하는 함수
// 입력 : [1, 3, 3, 3, 8]
// 결과 :
// 숫자 1 : 1개
// 숫자 3 : 3개
// 숫자 8 : 1개
   
func numCount (numArray: [Int]) -> [Int:Int]{
    var numDic: [Int:Int] = [:]
    for index in numArray {
        if numDic[index] != nil {
            numDic[index]! += 1
        } else {
            numDic[index] = 1
        }
    }
    return numDic
}
numCount(numArray: [1,3,3,3,8])
 

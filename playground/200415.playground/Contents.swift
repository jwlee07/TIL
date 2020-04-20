## 조건문, 반복문 연습

// 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)
func numCheck (numInPut: Int) {
    let numCal = numInPut % 2
    switch numCal {
    case numCal where numCal == 0 :
        print ("짝수 입니다.")
    default:
        print ("홀수 입니다.")
    }
}
numCheck(numInPut: 4)

//for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현
func threeSqure (numInPut: Int) -> Int {
    let numMax = 9
    var numSum = 1
    for _ in 1...numMax {
        numSum *= numInPut
    }
    return numSum
}
threeSqure(numInPut: 3)

//for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현
func descendingOrder () {
    let numMax = 10
    for index in 1...numMax {
        print (index)
    }
}
descendingOrder()

// 2 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단 내용을 출력하는 함수
func multiplicationTable (numInPut: Int) {
    let numMax = 9
    for index in 1...numMax {
        print ("\(numInPut) * \(index) = " , (numInPut * index))
    }
}
multiplicationTable(numInPut: 3)

//자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수
func numSum (numMax: Int) -> Int {
    var numAllSum = 0
    for index in 1...numMax {
        numAllSum += index
    }
    return numAllSum
}
numSum(numMax: 5)

//학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+, 4.0 = A, 3.5 = B+ ...)
func scoreClass (score: Double) -> String {
    switch score {
    case score where score >= 4.5:
        return "A+"
    case score where score >= 4.0:
        return "A"
    case score where score >= 3.5:
        return "B+"
    case score where score >= 3,0:
        return "B"
    default :
        return "C 이하."
    }
}
scoreClass(score: 4.2)

//특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
func calendarOutPut (numInPut: Int) -> String {
    var outMonth: String = " "
    let calendarDic: [Int:String] = [1:"Jan",2:"Feb",3:"Mar",4:"Apl",5:"May"]
    for (key,value) in calendarDic {
        if key == numInPut {
            outMonth = value
        }
    }
    return outMonth
}
calendarOutPut(numInPut: 3 )

//세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
func threeNumMultiplication (num1: Int, num2: Int, num3: Int) -> Bool {
    let numCal: Int = num1 * num2 * num3
    if numCal < 0 {
        return false
    }
    return true
}
threeNumMultiplication(num1: 1, num2: 1, num3: -5)


////자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
//(Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
//ex) 5! = 5 x 4 x 3 x 2 x 1
func factorial (numMax: Int) -> Int {
    var numSum = 1
    for index in 1...numMax {
        numSum *= index
    }
    return numSum
}
factorial(numMax: 4)


//- 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
//(2, 5 를 입력한 경우 결과는 2의 5제곱)
func numSqureTwo (numInPut: Int,numMax: Int) -> Int {
    var numMultiplication = 1
    for _ in 1...numMax {
        numMultiplication *= numInPut
    }
    return numMultiplication
}
numSqureTwo(numInPut: 3, numMax: 3)


//- 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
//(1234 인 경우 각 자리 숫자를 합치면 10)


//- 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
//그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
func numSumTwo (numMax: Int) -> Int {
    var numSum = 1
    for index in 1...numMax {
        if numSum < 2000 {
        numSum += index
        }
    }
    return numSum
}
numSumTwo(numMax: 20001)

//- 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
func numSumThree () -> Int {
    let numMax = 50
    var numSum = 1
    for index in 1...numMax {
        if !(index >= 20 && index <= 30) {
            numSum += index
        } else {continue}
    }
    return numSum
}
numSumThree()

//두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
//(1과 5 입력 시 15, 29와 30 입력 시 2930, 6과 100 입력 시 6100)
func numTwoSum (num1: Int, num2: Int) -> Int {
    let num1String = String(num1)
    let num2String = String(num2)
    let numResult = num1String + num2String
    return Int(numResult)!
}
numTwoSum(num1: 32, num2: 15)

//문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
func stringCheck (string1: String, string2: String) -> Bool {
    if string1 == string2 {
        return true
    }
    return false
}
stringCheck(string1: "abc", string2: "abc")

//자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
func numCommom (numMax: Int) -> [Int] {
    var numArray: [Int] = []
    for index in 1...numMax {
        if numMax % index == 0 {
            numArray.append(index)
        }
    }
    return numArray
}
numCommom(numMax: 10)

//100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
func numCommomTwo () -> [Int] {
    let numMax = 100
    var numArray = [Int]()
    for index in 1...numMax {
        if (index % 3 == 0) && (index % 5 == 0) {
            numArray.append(index)
        }
    }
    return numArray
}
numCommomTwo()



## Collection Type 연습

//1. ["p", "u", "p", "p", "y"] 라는 값을 가진 배열에서 마지막 "p" 문자 하나만 삭제하기
func arrayRm () -> [String] {
    var array = ["p", "u", "p", "p", "y"]
    if let lastArray = array.lastIndex(of: "p") {
        array.remove(at: lastArray)
    }
    return array
}
arrayRm()

// 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
// ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]
func numSame () -> [Int] {
    let numArrayFirst = [1, 2, 4, 8, 9, 12, 13]
    let numArraySecound = [2, 5, 6, 9, 13]
    var numArrayThrd: [Int] = []
    for num1 in numArrayFirst {
        for num2 in numArraySecound {
            if num1 == num2 {
                numArrayThrd.append(num1)
            }
        }
    }
    return numArrayThrd
}
numSame()

// 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수
// ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59
func numMax () -> Int {
    let numArray = [50, 23, 29, 1, 45, 39, 59, 19, 15]
    let numArrayMax = numArray.max()
    return numArrayMax!
}
numMax()

//Dictionary로 저장되어 있는 시험 성적의 평균 점수 구하기
// let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
func scorAverage () -> Int {
    var scoreResult = 1
    let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
    let count = scores.count
    for (_,value) in scores {
        scoreResult += value
    }
    return (scoreResult)/count
}
scorAverage()

//Dictionary로 저장된 scores 데이터를 튜플 타입을 지닌 배열로 변환하여 저장하기
// let scores = ["kor": 92,"eng": 88, "math": 96, "science": 89]
func scoreArray () -> [(String,Int)] {
    let scoresDic = ["kor": 92,"eng": 88, "math": 96, "science": 89]
    var scoresArr: [(String,Int)] = []
    for (key, value) in scoresDic {
        scoresArr.append((key,value))
    }
    return scoresArr
}
scoreArray()

//주어진 자료를 보고 Dictionary 자료형에 맞게 데이터를 변수에 저장하기
//위 문제에서 정의한 변수의 데이터 중 스쿨 배열에 저장된 첫번째 데이터를 꺼내어 출력하기
/*
 패스트캠퍼스
  - 스쿨
   * iOS 스쿨
   * 백엔드 스쿨
   * 프론트엔드 스쿨
  - 캠프
   * A 강의
   * B 강의
  - 온라인
   * C 강의
   * D 강의
  */

func checkDic () {
    let fastDic = ["패스트캠퍼스":["스쿨":["IOS 스쿨", "백엔드 스쿨", "프론트엔드 스쿨"],"캠프":["A 강의","B강의"],"온라인":["C 강의","D 강의"]]]
    if let fastcampus = fastDic["패스트캠퍼스"] {
        if let fastcampusSchool = fastcampus["캠프"] {
            print (fastcampusSchool[1])
        }
    }
}
checkDic()
 
//[보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
//위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
//스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
func personMatching () -> [String] {
    let personDic = ["철수":"apple", "영희":"banana","진수":"grape", "미희":"strawberry"]
    var personArr: [String] = []
    for ( key , value) in personDic {
        if value.contains("e") {
            personArr.append(key)
        }
    }
    return personArr
}
personMatching()

//임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
//ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
func numSort () -> [Int] {
    let firstNumArr = [2, 8, 7, 1, 4, 3]
    var sortNumArr: [Int] = []
    for index in firstNumArr {
        if index % 2 == 0 {
            sortNumArr.append(index)
        } else {
            sortNumArr.insert(index, at: 0)
        }
    }
    return sortNumArr
}
numSort()


//0 ~ 9 사이의 숫자가 들어있는 배열에서 각 숫자가 몇 개씩 있는지 출력하는 함수
//입력 : [1, 3, 3, 3, 8]
//결과 :
//숫자 1 : 1개
//숫자 3 : 3개
//숫자 8 : 1개

func numCheck (numArr: [Int]) -> [Int:Int] {
    var numDic: [Int:Int] = [:]
    for index in numArr {
        if numDic[index] != nil {
            numDic[index]! += 1
        } else {
            numDic[index] = 1
        }
    }
    return numDic
}
numCheck(numArr: [1,2,3,3,4,4])

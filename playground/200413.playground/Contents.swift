//(switch where clause 를 이용해 풀어볼 수 있으면 해보기)
//학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
func scoreClass (score: Double) -> String {
    switch score {
    case score where score == 4.5 :
        return ("A+")
    case score where score == 4.0 :
        return ("A")
    case score where score == 3.5 :
        return ("B+")
    case score where score == 3.0 :
        return ("B")
    default:
        return ("C")
    }
}
scoreClass(score: 3.0)



//특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
func checkMonth1 (num: Int) -> String {
    switch num {
    case 1 :
        return "Jan"
    case 2 :
        return "Feb"
    case 3 :
        return "Mar"
    case 4 :
        return "Apl"
    case 5 :
        return "May"
    case 6 :
        return "Jun"
    case 7 :
        return "Jul"
    case 8 :
        return "Aug"
    default:
        return "9월 이후 입니다."
        
    }
}
checkMonth1(num: 3)

func checkMonth2 (num: Int) -> String  {
    let calendar = [1:"Jan", 2:"Feb", 3:"Mar", 4:"Apl", 5:"May", 6:"Jun", 7:"Jul", 8:"Aug"]
    return (calendar[num]!)
}
checkMonth2(num: 1)



//세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수W

func checkNum1 (num1: Int, num2: Int, num3: Int) -> Bool {
    let result: Int = (num1 * num2 * num3)
    switch result {
    case result where result < 0:
        return false
    default :
        return true
    }
}
checkNum1(num1: 3, num2: 5, num3: 1)

func checkNum2 (num1: Int, num2: Int, num3: Int) -> Bool {
    if (num1 * num2 * num3) < 0 {
        return false
    }
    return true
}
checkNum2(num1: 3, num2: 2, num3: -4)

//반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.
//자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
//(Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
//ex) 5! = 5 x 4 x 3 x 2 x 1
func numFactorialFor (numMax: Int) -> Int {
    var numBase = 1
    var numSum = 1
    for _ in 1...numMax{
        numSum *= numBase
        numBase += 1
    }
return numSum
}
numFactorialFor(numMax: 7)


func numFactorialWhile (numMax: Int) -> Int {
    var numBase = 1
    var numSum = 1
    while numBase <= numMax {
        numSum *= numBase
        numBase += 1
    }
    return numSum
}
numFactorialWhile(numMax: 7)


func numFactorialRepeatWhile (numMax: Int) -> Int {
    var numBase = 1
    var numSum = 1
    repeat {
        numSum *= numBase
        numBase += 1
    } while numBase <= numMax
    return numSum
}
numFactorialRepeatWhile(numMax: 8)



//- 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
//(2, 5 를 입력한 경우 결과는 2의 5제곱)
func squareFor (num: Int, numMax: Int) -> Int {
    var numResult: Int = 1
    for _ in (1..<numMax+1) {
        numResult *= num
    }
return numResult
}
squareFor(num: 2, numMax: 5)


//- 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
//(1234 인 경우 각 자리 숫자를 합치면 10)
/*
func numSum (numInput: Int) -> Int {
    var numBase = 1
    var numResult = 0
    var numCalculation = 0
    let numString = String(numInput)
    let numCount = numString.count
    for _ in 1...numCount {
        numCalculation = numInput / numBase
        print (numCalculation)
        numResult += numCalculation
        numBase *= 10
        
    }
return numResult
}
numSum (numInput: 1234)

func numSum2 (numIntput2: Int) -> Int {
    let numString = String(numIntput2)
    var numInt = 0
    for index in numString {
        //numInt = Int(index)
    }
return 1
}
numSum2 (numIntput2: 1234)
*/


//- 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
//그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
func numSumCount (numMax: Int) -> Int {
    var numSum = 0
    for numCount in 1...numMax {
        if !(numSum > 2000) {
            numSum += numCount
        } else {
            return numSum
        }
    }
    return numSum
}
numSumCount(numMax: 35)


//- 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
func sumExemption () -> Int {
    var numSum = 0
    for numCount in 1...50 {
        if numCount > 20 && numCount < 30 {
                continue
        } else {
            numSum += numCount
        }
    }
return numSum
}
sumExemption()


//두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
//(1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
func numSum (firstNum: Int, secoundNum: Int) -> Int {
    let firstString = String(firstNum)
    let secoundString = String(secoundNum)
    let sumString = firstString + secoundString
    let sumInt = Int(sumString)
    return sumInt!
    
    //Best
    //let sumResult = String(firstNum) + String(secoundNum)
    //return Int(sumResult)!
}
numSum(firstNum: 5, secoundNum: 100)


//문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
func stringComparison (firstString: String, secoundString: String) -> Bool {
    if firstString == secoundString {
        return true
    }
    return false
}
stringComparison(firstString: "abc", secoundString: "abc")

//자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
func aliquotOut (numMax: Int) -> [Int] {
    var numArray = [Int]()
    for index in 1...numMax {
        if numMax % index == 0 {
            numArray.append(index)
        }
    }
return numArray
}
aliquotOut(numMax: 10)

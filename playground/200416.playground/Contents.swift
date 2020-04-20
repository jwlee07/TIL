// 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
func numCheck (numMax: Int) {
    var numCheckCount = 0
    for index in 1...numMax {
        if numMax % index == 0  {
            numCheckCount += 1
        }
    }
    if numCheckCount > 2 {
        print ("약수 입니다.")
    } else {
        print ("소수 입니다.")
        }
}
numCheck(numMax: 42)


//옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
func combineString1(str1: String?, str2: String?, str3: String?) -> String {
    var numPlus: String = " "
    if let str1Unrap = str1 {
        numPlus += str1Unrap
    }
    if let str2Unrap = str2 {
        numPlus += str2Unrap
    }
    if let str3Unrap = str3 {
        numPlus += str3Unrap
    }
    return numPlus
}
// 입력 예시 및 결과
combineString1(str1: "AB", str2: "CD", str3: "EF")
combineString1(str1: "AB", str2: nil, str3: "EF")


//사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
enum Arithmetic {
  case addition, subtraction, multiplication, division
  
    func numCal (num1: Int, num2 : Int) -> Int {
        switch self {
        case .addition :
            return num1 + num2
        case .subtraction :
            return num1 - num2
        case .multiplication :
            return num1 * num2
        case .division :
            return num1 / num2
        }
    }
}
var add = Arithmetic.addon
var sub = Arithmetic.subtraction
var mul = Arithmetic.multiplication
var div = Arithmetic.division

add.numCal(num1: 3, num2: 5)
sub.numCal(num1: 4, num2: 2)
mul.numCal(num1: 3, num2: 4)
div.numCal(num1: 4, num2: 2)



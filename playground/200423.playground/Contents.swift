import UIKit

// 1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
// e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2
func numSum (_ numIn: Int) -> Int {
    var numResult = 0
    if numIn > 0 {
        for index in 1...numIn {
            numResult += index
        }
    } else {
        for index in numIn...1 {
            numResult += index
        }
    }
    return numResult
}
numSum(5)

// 2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
// e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...
func threeMulStar (_ numIn: Int) -> [String] {
    let star = "*"
    var numResArr: [String] = []
    for index in 1...numIn {
        numResArr.append(String(index))
    }
    for index in 1...numResArr.count - 1 {
        if numResArr[index].contains("3") || numResArr[index].contains("6") || numResArr[index].contains("9") {
            numResArr.remove(at: index)
            numResArr.insert(star, at: index)
        }
    }
    return numResArr
}
threeMulStar(30)


// 3. 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
// e.g.  Input : 6, 9   ->  Output : 18, 3

func maxMIn (num1: Int, num2: Int) -> String {
    var sumRes = 0
    var maxIn = 0
    var minIn = 0
    var greatest = 0
    var commonMultiple = 0
    
    if num1 > num2 {
        maxIn = num1
        minIn = num2
    } else {
        maxIn = num2
        minIn = num1
    }
    sumRes = maxIn % minIn
    if !(sumRes == 0) {
        while sumRes == 0 {
            sumRes = minIn % sumRes
            print ("\(sumRes) = \(minIn) % \(sumRes)")
        }
    }
    greatest = minIn
    commonMultiple = (num1 * num2) / minIn
    
    return "Output : \(commonMultiple) \(greatest)"
}
maxMIn(num1: 6, num2: 9)







// 최대공약수
// 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
// 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복

// 최소 공배수
// - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수

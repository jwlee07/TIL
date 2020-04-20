/*
 1. width, height 속성을 가진 Rectangle 클래스 정의
 2. 생성자(초기화 메서드)에서 width, height 프로퍼티 값을 설정할 수 있도록 구현
 3. 사각형의 가로 세로 길이를 변경할 수 있는 메서드 구현
 4. 사각형 가로와 세로의 길이를 반환하는 메서드 구현
 5. 사각형의 넓이를 반환하는 메서드 구현
 6. 다음과 같은 속성을 지닌 인스턴스 생성
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 */

class Rectangle {
    var width: Int
    var height: Int
    init() {
        width = 0
        height = 0
    }
    func lengthChange (widthIn: Int, heightIn: Int) {
        width = widthIn
        height = heightIn
    }
    
    func lengthReturn () -> String {
        return "가로의 길이 : \(width) 세로의 길이 : \(height)"
    }
    
    func lengthArea () -> Int {
        return width * height
    }
}

let rectangle1 = Rectangle()
rectangle1.width = 10
rectangle1.height = 5
rectangle1.lengthChange(widthIn: 5, heightIn: 7)
rectangle1.width
rectangle1.height
rectangle1.lengthReturn()
rectangle1.lengthArea()

let rectangle2 = Rectangle()
rectangle2.width = 7
rectangle2.height = 7
rectangle2.lengthChange(widthIn: 5, heightIn: 9)
rectangle2.width
rectangle2.height
rectangle2.lengthReturn()
rectangle2.lengthArea()

/*
 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의
 2. TV 의 현재 채널 및 볼륨을 변경 가능한 메서드 구현
 3. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 구현
 4. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
    (직접 프로퍼티에 값을 설정할 수 없다고 가정)
 5. 채널과 볼륨 정보를 확인했을 때 TV 전원이 꺼져있으면 -1 이 반환되도록 구현
 */

class TV {
    var volume: Int
    var power: Int
    var channel: Int
    init () {
        volume = 0
        power = 0
        channel = 0
    }
    func channelVolumeChange (channelIn: Int, volumeIn: Int) {
        if !(power == 0) {
            channel = channelIn
            volume = volumeIn
        }
    }
    func channelVolumeCheck () -> String {
        if !(power == 0) {
            return "현재 채널 : \(channel), 현재 볼륨 : \(volume)"
        } else {
            return "-1"
        }
    }
}
let tv = TV()
tv.volume = 10
tv.channel = 15
tv.power = 1
tv.channelVolumeChange(channelIn: 5, volumeIn: 8)
tv.volume
tv.channel
tv.channelVolumeCheck()

/*
 1. 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 2. 원의 반지름을 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 */

class Square {
    var width: Int
    var heigh: Int
    init () {
        width = 0
        heigh = 0
    }
    func squareLength (widthIn: Int, heighIn: Int) {
        width = widthIn
        heigh = heighIn
    }
    func squareRound () -> Int {
        return (width + heigh) * 2
    }
    
    func squareArea () -> Int {
        return width * heigh
    }
}

let squre = Square()
squre.width
squre.heigh
squre.squareLength(widthIn: 3, heighIn: 5)
squre.squareRound()
squre.squareArea()

class Circle {
    var radius: Double
    var pi: Double
    init () {
        radius = 0
        pi = 3.14
    }
    
    func circleRadius (RadiusIn: Double) {
        radius = RadiusIn
    }
    
    func circlCircumference () -> Double {
        return radius * 2 * pi
    }
    
    func circlArea () -> Double {
        return radius * radius * pi
    }
}
let circle = Circle()
circle.radius
circle.pi
circle.circleRadius(RadiusIn: 8)
circle.circlCircumference()
circle.circlArea()
 
// 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.

// ** 강아지 (Dog)
// - 속성: 이름, 나이, 몸무게, 견종
// - 행위: 짖기, 먹기

class Dog {
    var name: String
    var age: Int
    var weight: Int
    var kind: String
    
    init () {
        name = "pupu"
        age = 3
        weight = 7
        kind = "maltese"
    }
    
    func bark () -> String {
        return "bark!!"
    }
    
    func eat () -> String {
        return "eat !"
    }
}

// ** 학생 (Student)
// - 속성: 이름, 나이, 학교명, 학년
// - 행위: 공부하기, 먹기, 잠자기
class Student {
    var name: String
    var age: Int
    var schoolName: String
    var year: Int
    
    init() {
        name = "jwlee"
        age = 26
        schoolName = "fastcampus"
        year = 3
    }
    
    func study () -> String {
        return "Study"
    }
    func eat () -> String {
        return "eat"
    }
    func sleep () -> String {
        return "sleep"
    }
    
}

// ** 아이폰(IPhone)
// - 속성: 기기명, 가격, faceID 기능 여부(Bool)
// - 행위: 전화 걸기, 문자 전송
class IPhone {
    var apparatusName: String
    var price: Int
    var faceID: Bool
    init() {
        apparatusName = "iPhone7"
        price = 30
        faceID = true
    }
    
    func call () -> String {
        return "call"
    }
    func face () -> Bool {
        return false
    }
}
// ** 커피(Coffee)
// - 속성: 이름, 가격, 원두 원산지
class Coffee {
    var name: String
    var price: Int
    var country: String
    init () {
        name = "kanu"
        price = 3000
        country = "korea"
    }
}
// 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
// ** 계산기 (Calculator)
// - 속성: 현재 값
// - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화

class Calculator {
    var value: Int
    
    init () {
        value = 0
    }
    func add (_ valueIn: Int) -> Int {
        value = value + valueIn
        return value
    }
    func subtract (_ valueIn: Int) -> Int {
        value = value - valueIn
        return value
    }
    func multiply (_ valueIn: Int) -> Int {
        value = value * valueIn
        return value
    }
    func divide (_ valueIn: Int) -> Int {
        value = value / valueIn
        return value
    }
    func reset () {
        value = 0
    }
}
let calculator = Calculator() // 객체생성
calculator.value  // 0
calculator.add(10)    // 10
calculator.add(5)     // 15
calculator.subtract(9)  // 6
calculator.subtract(10) // -4
calculator.multiply(4)   // -16
calculator.multiply(-10) // 160
calculator.divide(10)   // 16
calculator.reset()      // 0

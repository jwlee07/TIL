import UIKit

// Animal, Human, Pet, Cat 클래스 정의
// 상속을 적용해 필요한 속성을 모두 가지면서도 각각 다른 속성과 값을 지닐 수 있도로 구현

class Animal {
    var brain: Bool
    var legs: Int
    init () {
        brain = true
        legs = 0
    }
}
let animal = Animal ()
animal.brain
animal.legs

class Human: Animal {
    override var legs: Int {
        get {super.legs}
        set {super.legs = newValue}
    }
}
let human = Human()
human.legs = 2
human.legs

class Pet: Animal {
    var fleas: Int
    override init() {
        fleas = 0
    }
    override var legs: Int {
        get {super.legs}
        set {super.legs = newValue}
    }
}
let pet = Pet()
pet.fleas
pet.legs = 4
pet.legs

class Dog: Pet {
    override var fleas: Int {
        get {super.fleas}
        set {super.fleas = newValue}
    }
}
let dog = Dog()
dog.fleas = 8
dog.fleas

class Cat: Pet {
    override var fleas: Int {
        get {super.fleas}
        set {super.fleas = newValue}
    }
}
let cat = Cat()
cat.fleas = 4
cat.fleas


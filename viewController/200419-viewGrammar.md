## View Controller LifeCycle
* View Controller가 생성, 화면에 나오고, 사라지고 하는 개념

```swift
import UIKit

class DetailViewController: UIViewController {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        print ("awakeFromNib")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print ("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print ("viewDidDisappear")
    }
    
    deinit {
        print ("deinit")
    }
}
```


## Struct VS Class
* 데이터 구조 형태로 사용 시 Struct 형태가 시간 절약.  

```swift
struct Test Struct {
	var name: String
	var age: Int
	init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
}

class Test Class {
	var name: String
	var age: Int
	init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
}

class ViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		var testStruct: [TestStruct] = []
		var testStruct: [TestClass] = []
		
		let startTime = CFAbsoluteTimeGetCurrent()
		for _ in 0..<10000000 {
			testStruct.append(TestStruct.init(name:"aa", age:0))
		}
	let durationTime = CFAbsoluteTimeGetCurrent() - startTime
	
			let startTime = CFAbsoluteTimeGetCurrent()
		for _ in 0..<10000000 {
			testClass.append(TestClass.init(name:"aa", age:0))
		}
	let durationTime = CFAbsoluteTimeGetCurrent() - startTime
	
	
	durationTime struct : 2.4948948
	durationTime Class : 3.5948948
	}
}
```

## Unwind Segue
* View간의 Button을 사용하여 이동 중 가고자 하는 곳에 다이렉트로 View 이동 가능

```swift

@IBAction func unwind(segue: UIStoryboardSegue) {

}

```

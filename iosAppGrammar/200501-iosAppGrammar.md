# UIViewController


## ViewController
* 앱 구조의 뼈대, 모든 앱에 반드시 하나 이상
* Model <- ViewController-> View
* Events 처리
* Resource Managment (ARC)


#### View Management
* View들을 관리하는 역할

![UIViewController_1](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIViewController/UIViewController_1.png)

* Content
	* 모든 뷰를 단독으로 관리
	* UIViewController, UITableViewController, UITableViewController


* Containter
	* RootView 만 관리
	* UINavigationController, UITabbarController

## Hierarchy
* UIWindow 자체는 유저에게 보여지는 컨텐츠를 가지지 못함 (맨 밑바닥)

![UIViewController_2](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIViewController/UIViewController_2.png)

* Window는 하늘색 이지만 VIew가 초록색이기 때문에 초록색이 표현.

#### Container ViewController
![UIViewController_3](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIViewController/UIViewController_3.png)

#### Presented ViewController
![UIViewController_4](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIViewController/UIViewController_4.png)

* 가장 마지막으로 Presented한 View를 보게 된다.

#### ViewController Life Cycle
![UIViewController_5](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIViewController/UIViewController_5.png)

-----
![UIViewController_6](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/UIViewController/UIViewController_6.png)




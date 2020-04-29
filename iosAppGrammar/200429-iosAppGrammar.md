# App Life Cycle

## MVC Model
![appLifeCycle_1](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/appLifeCycle/AppLifeCycle_1.png)
#### Controller
* App Delegate : App을 실행시키기 위해 Model, Controller, View 유통
* View Controller : 시점 설정

#### View
* UIWindow : Window위에 View를 올리는 개념
* View and UI Object : 사용자가 실질적으로 보는 VIew and Objects

#### Model
* App의 데이터를 관리

## Main Run Loop
![appLifeCycle_2](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/appLifeCycle/AppLifeCycle_2.png)

#### Main run Loop
* Event Queue의 Event를 상시 확인 후 발생 시 App obj에 전달

## State Change Ios App
![appLifeCycle_3](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/appLifeCycle/AppLifeCycle_3.png)

* Not Running : App이 실행되지 않는 상황
* Foreground : App이 실행되고 사용자가 볼수 있는 화면
	* Inactive : 실행 중이지만 이벤트가 없는 상태
	* Active : 실질적으로 활동하고 있는 상태
* BackGround : 화면에는 보이지 않지만 App이 죽진 않고 실행 중 ex) 뮤직플레이어
* SusPended : 메모리에 적재된 상태지만 작업이 없는 상태

#### Execution States
![appLifeCycle_4](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/appLifeCycle/AppLifeCycle_4.png)

## Launch Time
![appLifeCycle_5](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/appLifeCycle/AppLifeCycle_5.png)

## In To ForeGround
![appLifeCycle_6](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/appLifeCycle/AppLifeCycle_6.png)

* 사용자가 App 실행 시 다른 앱으로 전환 전까지 EventLoop를 통해 확인하여 Events를 처리.

## In To BackGround
![appLifeCycle_7](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/appLifeCycle/AppLifeCycle_7.png)

* App이 BackGround에서 실행이 가능 하면 Monitor Events를 통해 처리.
* App의 작업이 없다면 Suspend로 보낸다.

## Alert-Based Interruptions
![appLifeCycle_8](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/appLifeCycle/AppLifeCycle_8.png)
![appLifeCycle_9](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/appLifeCycle/AppLifeCycle_9.png)

* Alert 발생 시 Igonore 여부에 따라 앱의 전환이 이뤄진다.

## Background Transittion Cycle
![appLifeCycle_10](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/appLifeCycle/AppLifeCycle_10.png)

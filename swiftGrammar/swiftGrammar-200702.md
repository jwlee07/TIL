# GCD (Grand Central Dispatch)

## History

```
초기에는 마이크로 프로세서의 clock 속도를 높이는 방식으로 연산 속도를 높였다. 하지만 점점 증가하는 전력 소비와 발생하는 열로 인해 단일 프로세서의 clock 속도 증가에 한계를 맞게 되었으며, 이는 특히 모바일에서 영향을 크게 받았다. 따라서 CPU 벤더들은 단일 CPU 의 클럭 속도를 개선하는 대신 여러 개의 CPU 를 탑재하는 형태로 효율을 높이는 것에 초점을 맞추게 되었다.프로세서의 클럭 속도가 빨라지면서 자연스럽게 소프트웨어도 빨라지던 예전과 달리 멀티 코어 프로세서에서는 멀티 프로세서에게 어떻게 잘 프로그램의 동작을 배분하는 지가 중요해졌다. GCD 이전에는 멀티 스레딩을 위해 Thread 와 OperationQueue 등의 클래스를 사용했는데, Thread 는 복잡하고 Critical Section 등을 이용한 Lock 을 관리하기 까다로웠고,OperationQueue 는 GCD 에 비해 무겁고 Boilerplate 코드들이 많이 필요한 문제가 있었다.

GCD (Grand Central Dispatch)는 멀티 코어 프로세서 시스템에 대한 응용 프로그램 지원을 최적화하기 위 해 Apple에서 개발한 기술로 스레드 관리와 실행에 대한 책임을 어플리케이션 레벨에서 운영체제 레벨로 넘겼다.작업의 단위는 Block 이라 불리며, DispatchQueue 가 이 Block 들을 관리하였다.GCD 는 각 어플리케이션에서 생성된 DispatchQueue 를 읽는 멀티코어 실행 엔진을 가지고 있으며, 이것이 Queue에 등록된 각 작업을 꺼내 스레드에 할당하였다.개발자는 내부 동작을 자세히 알 필요 없이 Queue 에 작업을 넘기기만 하면 되게 되었다.Thread 를 직접 생성하고 관리하는 것에 비해 관리 용이성과 이식성, 성능 증가 하였다.
```

## Migrating Away from Threads

* 애플 공식 문서 -Thread 클래스 대신 GCD 사용 권장

![GCD_1](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/GCD/GCD_1.png)

* GCD 의 장점
```
- 앱의 메모리 공간에 있는 스레드 스택에 저장하는데 따른 메모리상의 불이익 감소
- 스레드를 생성하고 구성하는데 필요한 코드 제거
- 스레드에서 작업을 관리하고 스켸쥴링하는데 필요한 코드 제거
- 코드 단순화
```

## DispatchQueue

```
- GCD는 앱이 블록 객체 형태로 작업을 전송할 수 있는 FIFO대기열 (Queue)을 제공하고 관리
- Queue에 전달된 작업은 시스템이 전적으로 관리하는 스레드 풀(a pool of threads)에서 실행 됨
- 작업이 실행될 스레드는 보장되지 않음
- DispatchQueue는 2개의 타입 (Serial / Concurrent)로 구분되며 둘 모두 FIFO 순서로 처리
- 앱을 실행하면 시스템이 자동으로 메인스레드 위에서 동작하는 Main Queue(Serial Queue)를 만들어 작업을 수행하고, 그 외에 추가적으로 여러 개의 Global Queue (Cuncurrent Queue)를 만들어 큐를 관리
- 각 작업은 동기(sync)방식과 비동기(async) 실행 가능 하지만 Main Queue에서는 async만 사용 가능
```

## Serial Queue

* 대기열에 들어온 작업을 특정 하나의 스레드에서 순서대로 처리

![GCD_2](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/GCD/GCD_2.png)

## Concurrent Queue

* 대기열에 들어온 작업을 다중 스레드로 나누어 동시에 (물리적 또는 논리적으로) 처리

![GCD_3](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/GCD/GCD_3.png)

## Concurrency vs Parallelism

![GCD_4](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/GCD/GCD_4.png)

## Synchronous

* 대기열에 작업을 추가한 뒤, 다른 어떤 스레드(시스템 결정)에서 실행 완료할 때까지 멈추어 대기 해당 작업이 완료되어 결과가 반환되면 다음 작업을 실행

![GCD_5](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/GCD/GCD_5.png)

## Asynchronous

* 대기열에 작업을 추가한 뒤, 작업 완료를 기다리지 않고 바로 반환하여 다음 작업을 연이어 수행 주로 네트워크에서 데이터를 가져오거나 큰 파일을 다룰 떄와 같이 시간이 걸리는 작업에 사용

![GCD_6](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/GCD/GCD_6.png)

## Sync vs Async

![GCD_7](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/GCD/GCD_7.png)


![GCD_8](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/GCD/GCD_8.png)

## System DispatchQueue

* 시스템이 제공하는 Queue는 Main과 Global이 있으며 앱 실행 시 생성

### Main

```swift
- UI와 관련된 작업은 모두 main 큐를 통해서 수행하며 Serial Queue에 해당
- MainQueue를 sync메서드로 동작시키면 Dead Lock 발생

DispatchQueue.main.async {}
```

### Global

```swift
- UI를 제외한 작업에서 사용하며 Concurrent Queue에 해당
- sync와 async 메서드 모두 가능
- Qos 클래스를 지정하여 우선 순위 설정 가능

DispatchQueue.global().async {}
DispatchQueue.global(qos: .utility).sync {}
```

## Custom DispatchQueue

* Non Main Thread에서 작업 수행
* Serial / Concurrent Queue 및 QoS 등의 여러 옵션을 지정하여 생성 가능

```swift
public convenience init(
label: String,
qos: DispatchQoS = default,
attributes: DispatchQueue.Attributes = default,
autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency = default,
target: DispatchQueue? = default
)

let queue = DispatchQueue(label: "labelName")

let queueOptions = DispatchQueue(label: "labelName",
qos: .userInteractive,
attributes: [.concurrent])
```

## QoS (Quality of Service)

```
- 시스템은 QoS 정보를 통해 스켸쥴링, CPU 및 I/O 처리량, 타이머 대기 시간 등의 우선 순위를 조정
- 총 6개의 QoS 클래스로, 4개 주요 유형과 다른 2개 특수 유형으로 구분
- 우선 순위가 높을 수록 더 빨리 수행되고 더 많은 전력 소모
- 수행 작업에 적절한 QoS 클래스를 지정해주어야 더 반응성이 좋아지며, 효율적인 에너지 사용 가능
```

![GCD_9](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/GCD/GCD_9.png)

## Primary QoS classes

* User Interactive

```
- 즉각 반응해야 하는 작은 분량의 작업에 사용, 반응성 및 성능에 중점
- 인터페이스 새로 고침, 화면 줌 인/아웃과 같이 사용자와의 상호작용 도중에 빠르게 처리하고 다시 Main Queue로 돌아와야 할 정도로 빠른 반응이 필요한 경우에 사용
```

* User Initiated

```
- 몇 초 이내의 짧은 시간 내 수행해야 하는 작업으로 반응성 및 성능에 중점, 가장 자주 활용
- 화면을 스와이프하거나 문서 열기, 버튼을 눌러 액션을 수행하는 것처럼 사용자에 의 발생한 이벤트에 사용
```

* Utility

```
- 수초에서 수분에 걸쳐 수행되는 작업으로 반응성, 성능, 그리고 에너지 효율성 간에 균형을 유지하는데 중점
- 일반적으로 사용자가 직접 요청하지 않는 작업으로, 데이터를 읽어들이거나 다운로드 하는 등 작업을 완료하는데 어느 정도 시간이 걸릴 수 있으며 보통 진행 표시줄로 표현
```

* Background

```
- 수분에서 수시간에 걸쳐 수행되는 작업으로 에너지 효율성에 중점, NSOperation 클래스 사용 시 기본 값
- background에서 동작하며 큰 데이터 가공 및 DB 구성/ 삭제/ 백업 등 사용자가 볼 수 없고 오래 걸리는 작업에 할당
- 저전력 모드에서는 네트워킹을 포함하여 백그라운드 작업은 일시 중지
```

## Special QoS Classes

* 일반적으로, 별도로 사용할 일이 없는 특수 유형의 QoS

```
- Default
	- QoS를 별도로 지정하지 않으면 기본값으로 사용되는 형태이며 User Initiated 와 Utility의 중간 레벨
	- GCD global queue의 기본 동작 형태

- Unspecified
	- QoS 정보가 없으므로 시스템이 QoS를 추론해야 한다는 것을 의미
```

![GCD_10](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/GCD/GCD_10.png)

## DispatchQueue.Attributes

* .concurrent - Concurrent Queue 로 생성, 이 옵션 미 지정시 Serial Queue 가 기본값
* .initiallyInactive - Inactive 상태로 생성, 작업 수행 시점에 activate() 메서드를 호출해야 동작

```swift
extension DispatchQueue {
public struct Attributes : OptionSet {
public static let concurrent: DispatchQueue.Attributes
public static let initiallyInactive: DispatchQueue.Attributes
	} 
}
```
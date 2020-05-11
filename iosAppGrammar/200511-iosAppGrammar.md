# Memory Management

#### Memory Management Without ARC

* GC (Garbage Collection)
	* 정기적으로 Garbage Collector가 동작하여 더이상 사용하지 않는 메모리 반환하는 방식

* MRR (Manual Retain-Release) / MRC (Manual Referece Counting)
	* RC(Reference Counting)을 통해 메모리를 수동으로 관리하는 방식
	* retain / release / autorelease등의 메모리 관리 코드를 직접 호출
	* 개발자가 명시적으로 RC를 증가시키고 감소하는 작업 수행


## MRR

#### Reference Counting
* retain : count 1 증가 
* release : count 1 감소 

![MemoryManagement_1](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_1.png)

#### Leak VS Danglinh Pointer
* 카운트 할당과 해제는 균형이 맞아야 한다
* alloc, retain이 많을 경우 Memory Leak 발생
* release가 많을 경우 Dangling Pointer (허상, 고아) 발생

![MemoryManagement_2](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_2.png)

## ARP (Automatic Reference Counting)
* RC 자동 관리 방식 (WWDC 2011 발표)
* 컴파일러가 개발자를 대신하여 메모리 관리 코드를 적절한 위치에 자동 삽입
* GC처럼 런타임이 아닌 컴파일 단에서 처리 (Heap에 대한 스캔 불필요 / 앱 일시 정지 현상 없음)

![MemoryManagement_3](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_3.png)

* 클래스 인스턴스에만 사용 (Class : Reference 타입, Struct / Enum - Value 타입)
* 강한참조 (Strong) : 기본값, 참조될 때마다 참조 카운트 1 증가
* 약한참조(Weak), 미소유 참조(Unowned) : 참조 카운트 증가 시키지 않음
* 강한 순환 참조 (Strong Reference Cycles) 주의 필요

![MemoryManagement_4](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_4.png)

#### ARC Class 과정

![MemoryManagement_5](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_5.png)

![MemoryManagement_6](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_6.png)

* Stack 영역 공간 생성

![MemoryManagement_7](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_7.png)

* Heap 영역 공간 생성

![MemoryManagement_8](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_8.png)

* point 1 부터 해당 Class의 구조가 있는 Heap 공간에 Point 지정, RefCount 1 증가

![MemoryManagement_9](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_9.png)

![MemoryManagement_10](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_10.png)

* point 2도 동일하게 Heap 공간에 Point 지정, RefCount 1증가
* point 2.x = 5 설정을 통해 Heap의 x값 5.0으로 변경

![MemoryManagement_11](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_11.png)

* release(point 1) -> refCount 1 감소

![MemoryManagement_12](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_12.png)

* release(point 2) -> refCount 1 감소

![MemoryManagement_13](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_13.png)

![MemoryManagement_14](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_14.png)

* refCount가 0이 되었기 때문에 소멸

#### ARC Struct 과정

![MemoryManagement_15](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_15.png)

* stack에 각 struct별 공간 할당

![MemoryManagement_16](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_16.png)

* point 1 값 설정

![MemoryManagement_17](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_17.png)

* point 2는 point 1의 값을 참조하여 설정

![MemoryManagement_18](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_18.png)

* point2.x = 5로 Stack point 2 x값 변경

![MemoryManagement_19](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_19.png)

* 사용 후 소멸

#### Strong Reference Cycle
* 객체에 접근 가능한 모든 연결을 끊었음에도 순환 참조로 인해 활성화된 참조 카운트가 남아 있어 메모리 누수 발생

![MemoryManagement_20](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_20.png)

* 객체 1을 참조하는 것으로 시작하여 객체 5까지 생성

![MemoryManagement_21](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_21.png)

* 객체 1 해제

![MemoryManagement_22](https://github.com/jwlee07/TIL/blob/master/iosAppGrammar/image/MemoryManagement/MemoryManagement_22.png)

* 객체 1 해제되어도 이후 ref Count 1씩 남아있기 때문에 해제되지 않음

```
해당 경우는 Weak, Unknowd를 사용하여 refCount를 주지 않고 생성해야함
```
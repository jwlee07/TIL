# Algorithm

* Algorithm [ӕlgərɪðəm] (앨거리덤, 알고리듬 / 알고리즘 (x))
* 어떤 문제를 해결하기 위해 정의된 절차와 방법, 명령어의 집합
* 9세기 페르시아 수학자, 무하마드 알콰리즈미(Muhammad al-Kwarizmi)의 이름에서 유래 

## Flowchart

![Algorithm_1](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Algorithm/Algorithm_1.png)

![Algorithm_2](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Algorithm/Algorithm_2.png)


## Condition

* 알고리즘은 다음의 조건을 만족해야 함

```
- 입력 : 외부에서 제공되는 자료가 0개 이상 존재한다.
- 출력 : 적어도 1개 이상의 결과물을 출력해야 한다.
- 명확성 : 수행과정은 명확해야 하고 모호하지 않은 명령어로 구성되어야 한다.
- 효율성 : 모든 과정은 명백하게 실행 가능(검증 가능)한 것이어야 한다.
- 유한성(종결성) : 알고리즘의 명령어들은 계산을 수행한 후 반드시 종료해야 한다.
```

# Sorting Algorithm

* 알고리즘을 소개할 때 가장 대표적으로 소개되는 케이스
* worst, avarage, best case 등을 이해하기 쉽고 시각적으로 표현하기 좋음
* 다양한 곳에서 자주 쓰이기 때문에 이미 다양한 알고리즘이 나와있고 현재도 계속 연구 중

## Bubble Sort

* 인접한 두 원소의 크기를 비교하여 큰 값을 배열의 오른쪽으로 정렬해 나가는 방식

```
- 이미 대부분 정렬되어 있는 자료에서는 좋은 성능을 보이지만 그 외에는 매우 비효율적인 알고리즘
- 직관적이서 쉽고 빠르게 구현 가능하여 많이 알려져 있음
- 시간복잡도 : O(n2)
	- (n-1) + (n-2) + ... + 2 + 1 => n(n-1) / 2
```

![Algorithm_3](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Algorithm/Algorithm_3.png)

### Code

```swift
func bubbleSort(input: inout [Int]) {
  // MARK: - 1
    for firstIndex in 0..<input.count {
      for secondIndex in 0..<input.count {
        if input[firstIndex] < input[secondIndex] {
          input.swapAt(firstIndex, secondIndex)
          print (input)
        }
      }
    }
  // MARK: - 2
  guard !input.isEmpty else { return }
  for firstIndex in 1..<input.count {
    for secondIndex in 0..<input.count - firstIndex {
      guard input[secondIndex] > input[secondIndex + 1] else {continue}
    }
  }
}
```

## Selection Sort

* 데이터를 반복 순회하며 최소값을 찾아 정렬되지 않는 숫자 중 가장 좌측의 숫자와 위치 교환하는 방식

```
- 최소값 선택 정렬 (Min-Selection Sort) : 가장 작은 값을 기준으로 정렬 (오름차순)
- 최대값 선택 정렬 (Max-Selection Sort) : 가장 큰 값을 기준으로 정렬 (내림차순)
- 시간복잡도 : O(n2)
```

![Algorithm_4](https://github.com/jwlee07/TIL/blob/master/swiftGrammar/image/Algorithm/Algorithm_4.png)

### Code

```swift
func selectionSort(input: inout [Int]) {
  
  for firstIndex in input.indices {
    var minIndex = firstIndex
    for secondIndex in (firstIndex + 1)..<input.count {
      guard input[minIndex] > input[secondIndex] else { continue }
      minIndex = secondIndex
    }
    input.swapAt(firstIndex, minIndex)
  }
}
```

## 추가예정

* Insertion Sort
* Quick Sort
* Merge Sort



import UIKit

var alist = [56,17,63,34,77,52,68]
var count = 1
                                                                                
func insertionSort(alist: inout [Int]) {
    for i in 1..<alist.count {
        let tmp = alist[i]
        var j = i - 1
        while j >= 0 && alist[j] > tmp {
            alist[j + 1] = alist[j]
            j = j - 1
        }
        alist[j + 1] = tmp
    }
}

func mergeSort<T:Comparable>(list: [T]) -> [T] {
    if list.count <= 1 { return list }
    let center = list.count / 2
    let left = Array(list[0..<center])
    let right = Array(list[center..<list.count])
    
    func merge(left: [T],right: [T]) -> [T] {
        var left = left
        var right = right
        var result = [T]()
        
        while !left.isEmpty && !right.isEmpty {
            if left[0] <= right[0] {
                result.append(left.removeFirst())
            } else {
                result.append(right.removeFirst())
            }
        }
        if !left.isEmpty {
            result.append(contentsOf: left)
        }
        if !right.isEmpty {
            result.append(contentsOf: right)
        }
        return result
    }
    print("\(count)번째")
    count += 1
    print("list : ", list)
    print("left : ", left)
    print("right : ", right)
    print("==========")
    return merge(left: mergeSort(list: left), right: mergeSort(list: right))
}

// 함수 실행
insertionSort(alist: &alist)          // 삽입형 정렬
mergeSort(list: alist)                // 병합형 정렬

var intArray = Array<Int>()

intArray = [Int]()
intArray.capacity
intArray.reserveCapacity(500)
intArray.capacity

var stringSet: Set = ["Mary", "John", "Sally"]
print(stringSet.debugDescription)

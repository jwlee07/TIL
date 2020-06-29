import Foundation

// Single LinkedList

protocol LinkedListStack {
  var isEmpty: Bool { get } // 노드가 있는지 여부
  var size: Int { get }     // 전체 개수
  func push(node: Node)     // 데이터 삽입
  func peek() -> String?    // 마지막 데이터 확인
  func pop() -> String?     // 데이터 추출
}

final class Node {
  var value: String
  var next: Node?
  
  init(value: String, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

final class SingleLinkedList: LinkedListStack {
  private var head: Node? = nil
  var isEmpty: Bool { head == nil }
  var size: Int = 0
  
  private var lastNode: Node? {
    guard var currentNode = head else { return nil }
    while let nextNode = currentNode.next {
      currentNode = nextNode
    }
    return currentNode
    // head : A -> B -> C
  }
  
  func push(node newNode: Node) {
    size += 1
    
    if let lastNode = lastNode {
      lastNode.next = newNode
    } else {
      head = newNode
    }
  }
  
  func peek() -> String? {
    lastNode?.value
  }
  
  // A -> B -> C -> D (C에서 D를 끊어줘야 한다)
  func pop() -> String? {
    guard var currentNode = head else { return nil}
    while let _ = currentNode.next?.next {
      currentNode = currentNode.next!
    }
    
    size -= 1
    
    if let popValue = currentNode.next?.value {
      currentNode.next = nil
      return popValue
    } else {
      defer { head = nil } // defer : 함수가 종료되는 시점에 실행되게 되는 것
      return head!.value
    }
  }
}

let linkedList = SingleLinkedList()
linkedList.isEmpty

linkedList.push(node: Node(value: "A"))
linkedList.push(node: Node(value: "B"))
linkedList.peek()
linkedList.size

linkedList.isEmpty
linkedList.pop()
linkedList.push(node: Node(value: "C"))
linkedList.push(node: Node(value: "D"))
linkedList.peek()
linkedList.size

linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.size
linkedList.isEmpty

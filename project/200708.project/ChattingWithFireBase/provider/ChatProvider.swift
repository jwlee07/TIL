//
//  ChatProvider.swift
//  ChattingWithFireBase
//
//  Created by 이진욱 on 2020/07/08.
//  Copyright © 2020 jwlee. All rights reserved.
//

import Foundation
import Firebase

class ChatProvider {
  
  // MARK: - Property
  
  private var listener: ListenerRegistration?
  private let firestore = Firestore.firestore()
  var messages = [MessageModel]()
  
  // MARK: - AddListener
  
  // 비동기적인 일일때, 함수 실행 시 클로저로 비동기적인 일이 완료가 되었는지 알 수 있다.
  func addListener(completion: @escaping (Result<String, Error>) -> ()) {
    listener = firestore
      .collection("Chat")
      .addSnapshotListener { (snapshot, error) in
        if let error = error {
          completion(.failure(error))
        } else {
          guard let documents = snapshot?.documents else { return }
          var tempMessages = [MessageModel]()
          for document in documents {
            let data = document.data()
            guard
              let nickName = data[MessageReference.nickName] as? String,
              let content = data[MessageReference.content] as? String,
              let timestamp = data[MessageReference.date] as? Timestamp
              else { return }
            
            let tempMessage = MessageModel(
              nickName: nickName,
              content: content,
              date: timestamp.dateValue())
            
            tempMessages.append(tempMessage)
          }
          
          tempMessages.sort {$0.date < $1.date}
          self.messages = tempMessages
          completion(.success("Success"))
        }
    }
  }
  
  // MARK: - AddMessage
  
  func addMessage(content: String) {
    guard let nickName = UserDefaults.standard.string(forKey: UserReference.nickName) else { return }
    
    firestore
      .collection("Chat")
      .addDocument(data: [
        MessageReference.nickName: nickName,
        MessageReference.content: content,
        MessageReference.date: Timestamp()
      ])
  }
  
  // MARK: - RemoveListener
  
  func removeListener() {
    listener?.remove()
  }
}


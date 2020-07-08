//
//  SignProvider.swift
//  ChattingWithFireBase
//
//  Created by 이진욱 on 2020/07/08.
//  Copyright © 2020 jwlee. All rights reserved.
//

import Foundation
import Firebase

class SignProvier {
  
  // MARK: - Property
  
  private let fireStore = Firestore.firestore() // 데이터베이스에 연결되기 위한 루트를 가지고 있음
  private let auth = Auth.auth() // 회원가입을 위한 인증
  
  // MARK: - SignIN
  
  func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> ()) {
    // auth는 Authentication에서 회원정보를 가져오게 되는 것
    auth.signIn(withEmail: email, password: password) { (result, error) in
      // password 는 데이터베이스에서 관리를 하지 않고 auth 영역에서 자동으로 한다.
      if let error = error {
        completion(.failure(error))
      } else {
        guard let user = result?.user else { return }
        
        // firsStore는 데이터베이스 접근을 위한 메서드
        self.fireStore
          .collection("User")
          .document(user.uid)
          .getDocument { (snapshot, error) in
            if let error = error {
              completion(.failure(error))
            } else {
              guard let data = snapshot?.data(),
                let nickName = data[UserReference.nickName] as? String
                else { return }
              
              UserDefaults.standard.set(email, forKey: UserReference.email)
              UserDefaults.standard.set(nickName, forKey: UserReference.nickName)
              
              completion(.success("Success"))
            }
        }
      }
    }
  }
  // MARK: - SignUp
  
  func signUp(email: String, password: String, nuckName: String, completion: @escaping (Result <String,Error>) -> ()) {
    auth.createUser(withEmail: email, password: password) { (result, error) in
      if let error = error {
        completion(.failure(error))
      } else {
        guard let user = result?.user else { return }
        self.fireStore
          .collection("User")
          .document(user.uid)
          .setData([
            UserReference.email : email,
            UserReference.nickName : nuckName]) { (error) in
              if let error = error {
                completion(.failure(error))
              } else {
                completion(.success("Success"))
              }
        }
      }
    }
  }
  func signOut() throws {
    try auth.signOut()
  }
}

// @escaping :

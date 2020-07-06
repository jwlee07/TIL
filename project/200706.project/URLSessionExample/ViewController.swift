//
//  ViewController.swift
//  URLSessionExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  private let imageUrlStr = "https://loremflickr.com/860/640/cat"
  
  // url 접속 port 수정
  // 네트워크는 무조건 비동기 쓴다
  
  
  
  // MARK: - Sync method
  
  @IBAction private func asyncMethod() {
    print("\n---------- [ asyncMethod ] ----------\n")
    guard let url = URL(string: imageUrlStr) else { return }
    
    // Async
    if let data = try? Data(contentsOf: url) {
      DispatchQueue.main.async {
        self.imageView.image = UIImage(data: data)
      }
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data else { return }
      DispatchQueue.main.async {
        self.imageView.image = UIImage(data: data)
      }
    }
    task.resume()
  }
  
  
  // MARK: - Get, Post, Delete
  
  // https://jsonplaceholder.typicode.com/
  
  @IBAction func requestGet(_ sender: Any) {
    print("\n---------- [ Get Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    guard let url = URL (string: todoEndpoint) else {
      return print ("Error : cannot Create URL")
    }
    let task = URLSession.shared.dataTask(with: url) { (data, error, response)  in
      guard error == nil else { return }
      guard let response = response as? HTTPURLResponse,
        (200..<300).contains(response.statusCode),
        response.mimeType == "application/json" else { return }
      
      guard let data = data else {return print ("No Data")}
      
      guard let todo = try? JSONSerialization.jsonObject(with: data) as? [String:Any],
        let todoID = todo["id"] as? Int,
        let todoTitle = todo["title"] as? String
        else {return print ("Could not get parsed data")}
      
      print ("ID : ", todoID)
      print ("Title : ", todoTitle )
    }
    
    //      guard error == nil else { return }
    //      guard let data = data else { return print ("data error !")}
    //
    //      guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String:String] else { return }
    //      if let userId = jsonObject["userID"],
    //      let id = jsonObject["id"],
    //      let title = jsonObject["title"],
    //        let completed = jsonObject["completed"] {
    //        print ("userId", userId)
    //        print ("id", id)
    //        print ("title", title)
    //        print ("completed", completed)
    //      }
    //    }
    
    task.resume()
  }
  
  
  @IBAction func requestPost(_ sender: Any) {
    print("\n---------- [ Post Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
    guard let url = URL (string: todoEndpoint) else {
      return print ("Error : cannot Create URL")
    }
    let newToDo: [String:Any] = ["title":"My todo", "userId":"20"]
    guard let jsonTodo = try? JSONSerialization.data(withJSONObject: newToDo) else { return }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = jsonTodo
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      guard let response = response as? HTTPURLResponse else { return }
      guard let data = data,
        let newItem = try? JSONSerialization.jsonObject(with: data) as? [String:Any]
        else { return }
      
      print (newItem)
      print (response.statusCode)
    }
    task.resume()
  }
  
  
  @IBAction func requestDelete(_ sender: Any) {
    print("\n---------- [ Delete Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    
    let url = URL(string: todoEndpoint)!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "DELETE"
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      guard let response = response as? HTTPURLResponse,
        response.statusCode == 200 // 대게 200이 success 코드이다.
        else { return }
      print ("DELETE ok")
    }
    task.resume()
  }
}



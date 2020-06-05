//
//  UserInfoViewController.swift
//  PhoneCallProject
//
//  Created by 이진욱 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    let listView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        createListView()
    }
    func setupView() {
        view.backgroundColor = .systemBackground
        title = "그룹 리스트"
        
        listView.frame = CGRect (
            x: view.safeAreaInsets.left + 20,
            y: view.safeAreaInsets.top + 100,
            width: view.frame.width - (MessageData.padding * 2),
            height: 200)
        listView.backgroundColor = .systemGray6
        listView.layer.cornerRadius = 15
        listView.clipsToBounds = true
        view.addSubview(listView)
        
    }
    func createListView() {
        guard MessageData.group.count != 2 else {return}
        let check = MessageData.messageUserList[MessageData.group[1]]
        MessageData.resultText = ""
        for _ in 0..<check!.count {
            MessageData.gropuLabel.font = .boldSystemFont(ofSize: 25)
            MessageData.gropuLabel.text = "그룹명 : \(MessageData.group[1])"
            MessageData.gropuLabel.textColor = .black
            MessageData.gropuLabel.frame = CGRect(x: listView.safeAreaInsets.left + 20, y: 20, width: listView.frame.width, height: 30)
            
            MessageData.nameLabel.font = .systemFont(ofSize: 18)
            MessageData.nameLabel.lineBreakMode = .byWordWrapping
            MessageData.nameLabel.adjustsFontSizeToFitWidth = false
            MessageData.nameLabel.numberOfLines = 0
            print(MessageData.count)
            MessageData.nameLabel.text = "목록"
            for (key, value) in check![MessageData.count - 1] {
                MessageData.resultText += "\n\(key) : \(value)"
            }
            MessageData.nameLabel.text!.append(contentsOf: MessageData.resultText)
            MessageData.nameLabel.textColor = .black
            MessageData.nameLabel.frame = CGRect (x: listView.safeAreaInsets.left + 20, y: 0, width: listView.frame.width, height: listView.frame.height)
            
            
            listView.addSubview(MessageData.gropuLabel)
            listView.addSubview(MessageData.nameLabel)
            
//            MessageData.CGcount += 1
            MessageData.count += 1
        }
    }
}


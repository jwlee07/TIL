//
//  ViewController.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit
import MessageUI

class MainViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupMessageTableView()
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    messageTableView.reloadData()
  }
    
    // MARK: TableViews
    private let phoneCallTableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .systemYellow
        tableView.alpha = 1
        return tableView
    }()
    private let messageTableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .systemGreen
        tableView.alpha = 1
        return tableView
    }()
    
    // MARK: Buttons
    private lazy var phoneCallButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Call", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(clickedPhoneCallEvent), for: .touchUpInside)
        return button
    }()

    @objc func clickedPhoneCallEvent(_ sender: UIButton) {
        
    }
    
    private lazy var messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Message", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(clickedMessageEvent), for: .touchUpInside)
        return button
    }()

    @objc func clickedMessageEvent(_ sender: UIButton) {
        
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        let layoutViews = [phoneCallTableView, phoneCallButton, messageTableView, messageButton]
        
        for item in layoutViews {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            phoneCallTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            phoneCallTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            phoneCallTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            messageTableView.topAnchor.constraint(equalTo: phoneCallTableView.bottomAnchor, constant: 16),
            messageTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            messageTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            messageTableView.heightAnchor.constraint(equalTo: phoneCallTableView.heightAnchor, multiplier: 1.0)
        ])
        
        NSLayoutConstraint.activate([
            phoneCallButton.topAnchor.constraint(equalTo: messageTableView.bottomAnchor, constant: 16),
            phoneCallButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            phoneCallButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            phoneCallButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            messageButton.topAnchor.constraint(equalTo: messageTableView.bottomAnchor, constant: 16),
            messageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            messageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            messageButton.leadingAnchor.constraint(equalTo: phoneCallButton.trailingAnchor, constant: 16),
            messageButton.widthAnchor.constraint(equalTo: phoneCallButton.widthAnchor),
            messageButton.heightAnchor.constraint(equalTo: phoneCallButton.heightAnchor)
        ])
      messageButton.addTarget(self, action: #selector(actionMessageButton), for: .touchUpInside)
    }
  func setupMessageTableView() {
    messageTableView.delegate = self
    messageTableView.dataSource = self
    view.addSubview(messageTableView)
  }
  @objc func actionMessageButton(_ sender: UIButton) {
    let messageComposer = MFMessageComposeViewController()
    messageComposer.messageComposeDelegate = self
    if MFMessageComposeViewController.canSendText(){
      messageComposer.recipients = MessageData.number
      messageComposer.body = "test"
      self.present(messageComposer, animated: true, completion: nil)
    }
  }
}

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MessageData.group.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let messageCell = messageTableView.dequeueReusableCell(withIdentifier: "Message") ?? UITableViewCell(style: .value1, reuseIdentifier: "Message")
    messageCell.textLabel?.text = MessageData.group[indexPath.row]
    messageCell.backgroundColor = .systemGreen
    messageCell.accessoryType = .disclosureIndicator
    return messageCell
  }
  
  
}
extension MainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if MessageData.group[indexPath.row] == "그룹 추가하기" {
      let signupVC = MessageSignUpViewController()
      signupVC.view.backgroundColor = .systemBackground
      navigationController?.pushViewController(signupVC, animated: true)
    } else if MessageData.group[indexPath.row] == "그룹 리스트 확인" {
      let userInfoVC = UserInfoViewController()
      userInfoVC.view.backgroundColor = .systemBackground
      navigationController?.pushViewController(userInfoVC, animated: true)
    } else {
      if MessageData.group[indexPath.row] != "" {
        for (_, value) in MessageData.messageUserList[MessageData.group[indexPath.row]]! {
          MessageData.number.append(value)
        }
      }
    }
  }
}
extension MainViewController: MFMessageComposeViewControllerDelegate {
  func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
      switch result {
      case MessageComposeResult.sent:
          print("전송 완료")
          break
      case MessageComposeResult.cancelled:
          print("취소")
          break
      case MessageComposeResult.failed:
          print("전송 실패")
          break
      @unknown default:
        break
    }
      controller.dismiss(animated: true, completion: nil)
  }
}



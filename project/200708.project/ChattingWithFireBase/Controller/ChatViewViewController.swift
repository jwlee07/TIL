//
//  ChatViewViewController.swift
//  
//
//  Created by 이진욱 on 2020/07/08.
//

import UIKit

class ChatViewViewController: UIViewController {
  
  // MARK: - Property
  
  private let pChat = ChatProvider()
  
  private let messageTableView = UITableView()
  private let messageTextField = UITextField()
  
  private var bottomConstraint: NSLayoutConstraint?
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBlue
    
    setUI()
    setConstraint()
    setNavigation()
    setKeyboardNotification()
    setNetwork()
  }
  private func setNetwork() {
    pChat.addListener { (result) in
      switch result {
      case.failure(let error):
        self.alertNormal(title: error.localizedDescription)
      case .success:
        self.messageTableView.reloadData()
        self.tableVieBottonScroll()
      }
    }
  }
  private func tableVieBottonScroll() {
    guard !pChat.messages.isEmpty else { return }
    messageTableView.scrollToRow(at: IndexPath(row: pChat.messages.count - 1, section: 0), at: .bottom, animated: true)
  }
}
// MARK: - extension ChatViewViewController

extension ChatViewViewController {
  
  private func setNavigation() {
    navigationItem.title = "Chat"
    let signOutBarButton = UIBarButtonItem (title: "나가기", style: .done, target: self, action: #selector(signOutBarButtonTap))
    navigationItem.leftBarButtonItem = signOutBarButton
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    view.backgroundColor = .systemBackground
    messageTextField.backgroundColor = .systemGray
    messageTextField.font = UIFont.boldSystemFont(ofSize: 30)
    messageTextField.delegate = self
    messageTableView.dataSource = self
    messageTableView.keyboardDismissMode = .onDrag
  }
  
  private struct Standard {
    static let space: CGFloat = 8
  }
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    [messageTableView, messageTextField].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      messageTableView.topAnchor.constraint(equalTo: guide.topAnchor),
      messageTextField.topAnchor.constraint(equalTo: messageTableView.bottomAnchor),
      messageTextField.heightAnchor.constraint(equalToConstant: 100)
    ])
    bottomConstraint = messageTextField.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    bottomConstraint?.isActive = true
  }
  // MARK: - Action
  
  @objc private func signOutBarButtonTap() {
    let pSign = SignProvier()
    do {
      try pSign.signOut()
      pChat.removeListener()
      UserDefaults.standard.removeObject(forKey: UserReference.email)
      UserDefaults.standard.removeObject(forKey: UserReference.nickName)
      WindowManger.set(.sign)
    } catch {
      alertNormal(title: error.localizedDescription)
    }
  }
  
}
// MARK: - extension Notification

extension ChatViewViewController {
  private func setKeyboardNotification() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotificationAction), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotificationAction), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc private func keyboardNotificationAction(_ notification: Notification) {
    guard
      let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
      let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt,
      let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
      else { return }
    let height = keyboardFrame.cgRectValue.height - view.safeAreaInsets.bottom
    
    UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
      switch notification.name {
      case UIResponder.keyboardWillShowNotification:
        self.bottomConstraint?.constant = -height
        
      case UIResponder.keyboardWillHideNotification:
        self.bottomConstraint?.constant = 0
      default:
        break
      }
      self.view.layoutIfNeeded()
    })
  }
}

// MARK: - UITextFieldDelegate

extension ChatViewViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let content = textField.text, !content.isEmpty else { return true }
    pChat.addMessage(content: content)
    textField.text = nil
    return true
  }
}

// MARK: - UITableViewDataSource

extension ChatViewViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    pChat.messages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ??  UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
    
    let message = pChat.messages[indexPath.row]
    cell.textLabel?.text = message.content
    cell.detailTextLabel?.text = message.nickName
    return cell
  }
}

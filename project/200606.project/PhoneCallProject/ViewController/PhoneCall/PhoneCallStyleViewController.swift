//
//  PhoneCallStyleViewController.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class PhoneCallStyleViewController: UIViewController {
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        let setupView = [dismissButton, buttonStackView]
        
        for item in setupView {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            dismissButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            dismissButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            dismissButton.widthAnchor.constraint(equalTo: dismissButton.heightAnchor)
        ])
        
        let styleCount: Int = 3
        for index in 0..<styleCount {
            let button = UIButton(type: .system)
            button.backgroundColor = .systemFill
            button.layer.cornerRadius = 15
            button.tag = index
            button.setBackgroundImage(UIImage(named: "CallStyle\(index)"), for: .normal)
            button.clipsToBounds = true
        
            if button.backgroundImage(for: .normal) != nil {
                button.addTarget(self, action: #selector(clickedStyleButton), for: .touchUpInside)
            }
            buttonStackView.addArrangedSubview(button)
        }
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonStackView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    @objc private func clickedStyleButton(_ sender: UIButton) {
        let receiveVC = ReceiveCallViewController()
        receiveVC.modalPresentationStyle = .overFullScreen
        receiveVC.callerViewStyle = sender.tag
        self.present(receiveVC, animated: true)
    }
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("✕", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.font = .boldSystemFont(ofSize: 50)
        button.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        return button
    }()

    @objc func clickedButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    var buttonStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
}

//
//  StackButtonLabel.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

protocol BigStackButtonDelegate: class {
    func clickedEventButton(_ isReceive: Bool, sender: UIButton)
}

class SmallStackButton: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    convenience init(title: String, color: UIColor, picName: String) {
        self.init()
        
        button.backgroundColor = color
        button.setImage(UIImage(systemName: picName), for: .normal)
        label.text = title
    }

    // MARK: - Setup Layout
    private func commonInit(){
        addSubview(button)
        addSubview(label)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: button.heightAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: button.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.layer.cornerRadius = button.frame.size.width / 2
    }
    
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "phone.down.fill"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        return button
    }()

    @objc func clickedButton(_ sender: UIButton) {
        
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "거절"
        label.font = .boldSystemFont(ofSize: 11)
        label.textAlignment = .center
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
}

class BigStackButton: UIView {
    var delegate: BigStackButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    convenience init(title: String, color: UIColor, picName: String, tag: Int) {
        self.init()
        
        button.backgroundColor = color
        
        let largeConfiguration = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .large)
        let smallSymbolImage = UIImage(systemName: picName, withConfiguration: largeConfiguration)
        
        button.setImage(smallSymbolImage, for: .normal)
        button.tag = tag
        label.text = title
        if tag == 2 {
            button.backgroundColor = UIColor(white: 1, alpha: 0.2)
        }
    }

    // MARK: - Setup Layout
    private func commonInit(){
        addSubview(button)
        addSubview(label)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: button.heightAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: button.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.layer.cornerRadius = button.frame.size.width / 2
    }
    
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "phone.down.fill"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        return button
    }()

    @objc func clickedButton(_ sender: UIButton) {
        if sender.tag == 0 {
            delegate?.clickedEventButton(false, sender: sender)
        } else if sender.tag == 1 {
            delegate?.clickedEventButton(true, sender: sender)
            self.label.alpha = 0
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "거절"
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
}

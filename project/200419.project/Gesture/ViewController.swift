//
//  ViewController.swift
//  Gesture
//
//  Created by 이진욱 on 2020/04/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jwleeView: UIImageView!
    @IBOutlet weak var centerY: NSLayoutConstraint!
    @IBOutlet weak var centerX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let left = UISwipeGestureRecognizer (target: self, action: #selector(move))
        left.direction = .left
        
        let right = UISwipeGestureRecognizer (target: self, action: #selector(move))
        right.direction = .right
        
        let up = UISwipeGestureRecognizer (target: self, action: #selector(move))
        up.direction = .up
        
        let down = UISwipeGestureRecognizer (target: self, action: #selector(move))
        down.direction = .down
        
        let tab = UITapGestureRecognizer (target: self, action: #selector(move))
        
        
        self.view.addGestureRecognizer(left)
        self.view.addGestureRecognizer(right)
        self.view.addGestureRecognizer(up)
        self.view.addGestureRecognizer(down)
        self.view.addGestureRecognizer(tab)
    }
    
    
    @objc func move (sender: UIGestureRecognizer) {
                
        if let swipe = sender as? UISwipeGestureRecognizer {
            switch swipe.direction {
            case .up :
                centerY.constant = centerY.constant - 50
            case .down :
                centerY.constant = centerY.constant + 50
            case .left :
                centerX.constant = centerX.constant - 50
            case .right :
                centerX.constant = centerX.constant + 50
            default:
                break
            }
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        if sender is UITapGestureRecognizer {
            centerY.constant = 0
            centerX.constant = 0
            
            UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            }
        }
    }
}

//
//  ReceiveCallViewController.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ReceiveCallViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPhoneCallReceive()
    }
    
    var callerViewStyle: Int = 0
    private lazy var callerView = CallerView(style: callerViewStyle)
    private func setupLayout() {
        callerView.frame = view.frame
        callerView.alpha = 1
        callerView.delegate = self
        
        view.addSubview(callerView)
    }
    
    private func setupPhoneCallReceive() {
        view.backgroundColor = .black
        
        let waitingTime = AppShared.timesList[AppShared.phoneCallMenu["시각"] ?? "3 Seconds Later"] ?? 3
        let convertTime = DispatchTime.now() + .seconds(waitingTime)
        
        DispatchQueue.main.asyncAfter(deadline: convertTime) {
            self.setupLayout()
        }
    }

}

extension ReceiveCallViewController: CallerViewDelegate {
    func callerViewDismiss() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}

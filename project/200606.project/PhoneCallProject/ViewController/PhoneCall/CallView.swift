//
//  CallView.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

protocol CallerViewDelegate: class {
    func callerViewDismiss()
}

class CallerView: UIView {
    var delegate: CallerViewDelegate?
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.commonInit()
//    }
    
    convenience init(style: Int = 0) {
        self.init()
        commonInit(style: style)
    }

    // MARK: - Init()
    private lazy var viewStyleDigit: Int = 0
    private lazy var viewArray = [nameLabel, detailLabel, /*profileImageView,*/ rejectButton, callButton, laterButton, messageButton]
    private lazy var totalViewArray: [UIView] = [backgroundImageView] + viewArray
    private func commonInit(style: Int = 0){
        viewStyleDigit = style
        
        for item in totalViewArray {
            self.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            detailLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rejectButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            rejectButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            rejectButton.widthAnchor.constraint(equalToConstant: 80),
            rejectButton.heightAnchor.constraint(equalTo: rejectButton.widthAnchor, multiplier: 1.5)
        ])
        
        NSLayoutConstraint.activate([
            callButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            callButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            callButton.widthAnchor.constraint(equalToConstant: 80),
            callButton.heightAnchor.constraint(equalTo: callButton.widthAnchor, multiplier: 1.5)
        ])
        
        NSLayoutConstraint.activate([
            laterButton.centerXAnchor.constraint(equalTo: rejectButton.centerXAnchor),
            laterButton.heightAnchor.constraint(equalTo: laterButton.widthAnchor, multiplier: 1.5),
            laterButton.bottomAnchor.constraint(equalTo: rejectButton.topAnchor, constant: -24),
            laterButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            messageButton.centerXAnchor.constraint(equalTo: callButton.centerXAnchor),
            messageButton.heightAnchor.constraint(equalTo: messageButton.widthAnchor, multiplier: 1.5),
            messageButton.bottomAnchor.constraint(equalTo: callButton.topAnchor, constant: -24),
            messageButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        rejectButton.delegate = self
        callButton.delegate = self
        
        // 진동 타이머 생성
        vibrateTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(vibrateTimerMethod), userInfo: nil, repeats: true)
        playAudio()
    }
    // Timer 변수 인스턴스 생성
    private var callingTimer = Timer()
    private var callingTimeCount = 0
    
    @objc private func timerMethod() {
        callingTimeCount += 1
        let minutes = String(format: "%02d", callingTimeCount / 60)
        let seconds = String(format: "%02d", callingTimeCount % 60)
        detailLabel.text = "\(minutes):\(seconds)"
    }
    
    // 진동 타이머 인스턴스 생성
    private var vibrateTimer = Timer()
    private var vibrateTimeCount = 0
    
    @objc private func vibrateTimerMethod() {
        vibrateTimeCount += 1
        if vibrateTimeCount.isMultiple(of: 2) { AudioServicesPlayAlertSound(4095) }
    }
    
    // MARK: - AVAudio Player
//    private var soundEffect: AVAudioPlayer?
    
    private func playAudio() {
        ShardAudio.shared.audioPlayer = nil
        let url = Bundle.main.url(forResource: "iPhoneBellSound", withExtension: "mp3")
        if let url = url{
            do {
                ShardAudio.shared.audioPlayer = try AVAudioPlayer(contentsOf: url)
                guard let sound = ShardAudio.shared.audioPlayer else { print("nil"); return }
                //sound.prepareToPlay()
                try AVAudioSession.sharedInstance().setCategory(.ambient)
                sound.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

    override func updateConstraints() {
        super.updateConstraints()
        
        if viewStyleDigit == 1 {
            viewArray.append(profileImageView)
            self.addSubview(profileImageView)
            profileImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                profileImageView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 60),
                profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor)
            ])
            
            if frame.size.height > 800 {
                profileImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
            } else {
                profileImageView.heightAnchor.constraint(equalToConstant: 250 / 2).isActive = true
            }
        }
    }
    
    // MARK: - Layout Subviews()
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundImageView.frame = self.bounds
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
    }
    
    
    // MARK: - Views
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "PhoneCallBackground"))
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        
        let name = AppShared.phoneCallMenu["발신자"] ?? "Hong GilDong"
        label.text = name
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "휴대전화"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let profileImageView: UIImageView = {
        var profileImage: UIImage = UIImage()
        
        if AppShared.phoneCallMenu["사진"] != nil {
            profileImage = UIImage(data: Data(base64Encoded: AppShared.phoneCallMenu["사진"]!)!)!
        } else {
            profileImage = UIImage(systemName: "person.circle.fill")!
        }
        let imageView = UIImageView(image: profileImage)
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .white
        return imageView
    }()
    
    let rejectButton = BigStackButton(title: "거절", color: .systemRed, picName: "phone.down.fill", tag: 0)
    let callButton = BigStackButton(title: "응답", color: .systemGreen, picName: "phone.fill", tag: 1)
    let laterButton = SmallStackButton(title: "나중에 보기", color: .clear, picName: "alarm.fill")
    let messageButton = SmallStackButton(title: "메세지", color: .clear, picName: "message.fill")
    
    // 통화 눌렀을 때 나타날 Views
    private let callerStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        return stackView
    }()
    private var isCallReceive: Bool = false
    
}

extension CallerView: BigStackButtonDelegate {
    func clickedEventButton(_ isReceive: Bool, sender: UIButton) {
        vibrateTimer.invalidate()
        ShardAudio.shared.audioPlayer?.stop()
        if !isReceive {
            for item in viewArray {
                detailLabel.text = "전화가 거절됨"
                item.alpha = 0.5
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.delegate?.callerViewDismiss()
                }
            }
        } else {
            if isCallReceive {
                detailLabel.text = "통화 종료"
                
                var tempViewArray = [nameLabel, detailLabel, callButton, callerStackView]
                if viewStyleDigit == 1 { tempViewArray.append(profileImageView) }
                
                for item in tempViewArray {
                    item.alpha = 0.5
                }
                callingTimer.invalidate()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.delegate?.callerViewDismiss()
                }
            } else {
                isCallReceive = true
                
                UIView.animate(withDuration: 1) {
                    sender.backgroundColor = .systemRed
                    
                    let largeConfiguration = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .large)
                    let smallSymbolImage = UIImage(systemName: "phone.down.fill", withConfiguration: largeConfiguration)
                    sender.setImage(smallSymbolImage, for: .normal)
                    
                    self.callButton.transform = CGAffineTransform(
                        translationX: (self.center.x - self.callButton.center.x),
                        y: 0
                    )
                    self.layoutIfNeeded()
                }
                
                let invisibleViewArray = [rejectButton, laterButton, messageButton]
                for item in invisibleViewArray { item.alpha = 0.0 }
                
                var limitRows: Int = 0
                var limitCols: Int = 0
                var buttonInfo: [[(String, String)]] = []
                
                switch viewStyleDigit {
                case 0:
                    limitRows = 2
                    limitCols = 3
                    buttonInfo = [
                        [("소리 끔", "mic.slash.fill"), ("키패드", "circle.grid.3x3.fill"), ("스피커", "speaker.3.fill")],
                        [("통화 추가", "plus"), ("FaceTime", "video.fill"), ("연락처", "person.crop.circle")]
                    ]
                case 1:
                    limitRows = 1
                    limitCols = 3
                    buttonInfo = [
                        [("스피커", "speaker.3.fill"), ("FaceTime", "video.fill"), ("소리 끔", "mic.slash.fill")]
                    ]
                default:
                    print("case Error")
                }
                
                for row in 0..<limitRows {
                    let rowStackView: UIStackView = {
                        let stackView = UIStackView()
                        stackView.axis = .horizontal
                        stackView.alignment = .fill
                        stackView.distribution = .fillEqually
                        stackView.spacing = 24
                        return stackView
                    }()
                    
                    for col in 0..<limitCols {
                        let title = buttonInfo[row][col].0
                        let icon = buttonInfo[row][col].1
                        let callButton = BigStackButton(title: title, color: .clear, picName: icon, tag: 2)
                        rowStackView.addArrangedSubview(callButton)
                    }
                    callerStackView.addArrangedSubview(rowStackView)
                }
                
                addSubview(callerStackView)
                callerStackView.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    callerStackView.bottomAnchor.constraint(equalTo: callButton.topAnchor, constant: -40),
                    callerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
                    callerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
                ])
                
                if viewStyleDigit == 0 { callerStackView.heightAnchor.constraint(equalToConstant: 250).isActive = true }
                else { callerStackView.heightAnchor.constraint(equalToConstant: 250 / 2).isActive = true }
                layoutIfNeeded()
                
                detailLabel.text = "00:00"
                callingTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerMethod), userInfo: nil, repeats: true)
                
                
                if AppShared.phoneCallMenu["녹음"] != nil {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        do {
                            try ShardAudio.shared.audioPlayer = AVAudioPlayer(contentsOf: ShardAudio.shared.audioRecorder!.url)
                            try AVAudioSession.sharedInstance().setCategory(.ambient)
                            ShardAudio.shared.audioPlayer?.play()
                        } catch {
                            print("audioPlayer error: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
    }
}

//
//  SoundRecordViewController.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/05.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit
import AVFoundation

// MARK: - 녹음 사운드 설정을 위한 View
class SoundRecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavi()
        setupLayout()
        setupRecord()
    }
    
    // MARK: - Setup Navi
    private func setupNavi() {
        let saveBarItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveRecordStatus))
        self.navigationItem.rightBarButtonItem = saveBarItem
    }
    
    @objc private func saveRecordStatus() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        view.backgroundColor = .white
        
        let buttonViews = [recordButton, playButton, stopButton]
        let layoutViews = [recordTitleLabel, isRecordPlayButton, buttonsStackView] + buttonViews
        
        for item in layoutViews {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            recordTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            recordTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            recordTitleLabel.heightAnchor.constraint(equalTo: isRecordPlayButton.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            isRecordPlayButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            isRecordPlayButton.leadingAnchor.constraint(equalTo: recordTitleLabel.trailingAnchor),
            isRecordPlayButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -48)
        ])
        
        for button in buttonViews {
            buttonsStackView.addArrangedSubview(button)
            button.layer.borderColor = UIColor.darkGray.cgColor
            button.layer.borderWidth = 1.5
        }

        recordButton.isEnabled = true; recordButton.alpha = 1.0
        playButton.isEnabled = false; playButton.alpha = 0.5
        stopButton.isEnabled = false; stopButton.alpha = 0.5
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: recordTitleLabel.bottomAnchor, constant: 40),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private lazy var recordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "통화 시 음성 재생 여부"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
//        label.backgroundColor = .white
        return label
    }()
    
    private lazy var isRecordPlayButton: UIButton = {
        let button = UIButton(type: .system)
        
        if AppShared.phoneCallMenu["녹음"] != nil {
            button.setTitle("ON", for: .normal)
            button.isSelected = true
        } else {
            button.setTitle("OFF", for: .normal)
            button.isSelected = false
        }
        
        button.backgroundColor = .clear
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(changedValueEvent), for: .touchUpInside)
        return button
    }()
    
    @objc private func changedValueEvent(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.setTitle("ON", for: .normal)
            AppShared.phoneCallMenu["녹음"] = ShardAudio.shared.saveRecordAudioURL
        } else {
            sender.setTitle("OFF", for: .normal)
            AppShared.phoneCallMenu["녹음"] = nil
        }
    }
    
    var buttonsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: - Setup Record
//    var audioPlayer: AVAudioPlayer?
//    var audioRecorder: AVAudioRecorder?
//    let saveAudioURL: String = "/sound1.caf"
    
    private func setupRecord() {
        // 아무런 녹음이 되지 않았기 때문에 버튼을 비활성화
        playButton.isEnabled = false
        stopButton.isEnabled = false
        
        ShardAudio.shared.setupRecord()
        
//        // 도큐먼트 디렉터리 확인
//        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//        let docsDir = dirPaths[0] as String
//
//        // sound.caf 이름의 파일을 위한 URL 구성
//        let soundFilePath = docsDir.appending(saveAudioURL)
//        let soundFileURL = URL(fileURLWithPath: soundFilePath)
//
//        // 녹음 품질 설정
//        let recordSettings = [AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
//                              AVEncoderBitRateKey: 16,
//                              AVNumberOfChannelsKey: 2,
//                              AVSampleRateKey: 44100.0] as [String : Any]
//
//        // 공유 오디오 세션 인스턴스를 반환 받는다.
//        let audioSession = AVAudioSession.sharedInstance()
//        do {
//            // 현재 오디오 세션의 카테고리를 정한다. (재생, 녹음)
//            try audioSession.setCategory(.playAndRecord)
//        } catch {
//            print("audioSession error: \(error.localizedDescription)")
//        }
//
//        // audioRecorder 인스턴스 생성
//        do {
//            try audioRecorder = AVAudioRecorder(url: soundFileURL, settings: recordSettings)
//            audioRecorder?.prepareToRecord()
//        } catch {
//            print("audioSession Error: \(error.localizedDescription)")
//        }
    }
    
    private lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("▶︎", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 100)
        button.tag = 1
        button.addTarget(self, action: #selector(clickedButtonEvents), for: .touchUpInside)
        return button
    }()
    
    private lazy var recordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("◉", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 100)
        button.tag = 0
        button.addTarget(self, action: #selector(clickedButtonEvents), for: .touchUpInside)
        return button
    }()
    
    private lazy var stopButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("◼︎", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 100)
        button.tag = 2
        button.addTarget(self, action: #selector(clickedButtonEvents), for: .touchUpInside)
        return button
    }()
    
    @objc private func clickedButtonEvents(_ sender: UIButton) {
        if sender.tag == 0 {    // Recording
            if ShardAudio.shared.audioRecorder?.isRecording == false {
                recordButton.isEnabled = false
                playButton.isEnabled = false
                stopButton.isEnabled = true
                ShardAudio.shared.audioRecorder?.record()
            }
        } else if sender.tag == 1 {     // Play
            if ShardAudio.shared.audioRecorder?.isRecording == false {
                stopButton.isEnabled = true
                recordButton.isEnabled = false
                playButton.isEnabled = false
                
                do {
                    try ShardAudio.shared.audioPlayer = AVAudioPlayer(contentsOf: ShardAudio.shared.audioRecorder!.url)
                    ShardAudio.shared.audioPlayer?.delegate = self
                    try AVAudioSession.sharedInstance().setCategory(.ambient)
                    ShardAudio.shared.audioPlayer?.play()
                } catch {
                    print("audioPlayer error: \(error.localizedDescription)")
                }
            }
        } else {    // Stop
            stopButton.isEnabled = false
            playButton.isEnabled = true
            recordButton.isEnabled = true
            
            if ShardAudio.shared.audioRecorder?.isRecording == true {
                ShardAudio.shared.audioRecorder?.stop()
            } else {
                ShardAudio.shared.audioPlayer?.stop()
            }
        }
        
        for button in [playButton, stopButton, recordButton] {
            button.isEnabled ? (button.alpha = 1.0) : (button.alpha = 0.5)
        }
    }
}

extension SoundRecordViewController: AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    // 재생 종료하면 호출
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        print("audioPlayerDidFinishPlaying")
        recordButton.isEnabled = true; recordButton.alpha = 1.0
        playButton.isEnabled = true; playButton.alpha = 1.0
        stopButton.isEnabled = false; stopButton.alpha = 0.5
    }
    
    // 디코더 에러 발생하면 호출
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("Audio Player Decode Error")
    }
    
    // MARK: - AVAudioRecorderDelegate
    
    // 시간 제한으로 녹음 종료하면 호출
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Record Success")
    }
    
    // 녹음중 에러 발생하면 호출
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        print("Audio Record Encode Error")
    }
}

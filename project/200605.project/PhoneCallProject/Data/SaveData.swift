//
//  SaveData.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

struct AppShared {
    static let phoneCallTitles = [("시각", "clock"), ("발신자", "person"), ("사운드", "speaker.2")]
    static var phoneCallMenu = [
        "시각": "3 Seconds Later",
        "발신자": "홍길동"
    ]
    
    static let timeTitles = ["3 Seconds Later", "10 Seconds Later", "30 Seconds Later",
                             "1 Minute Later", "2 Minutes Later", "5 Minutes Later",
                             "8 Minutes Later", "12 Minutes Later", "20 Minutes Later",
                             "30 Minutes Later", "1 Hour Later"
    ]
    static let timesList = [
        "3 Seconds Later": 3,
        "10 Seconds Later": 10,
        "30 Seconds Later": 30,
        "1 Minute Later": 60,
        "2 Minutes Later": 60 * 2,
        "5 Minutes Later": 60 * 5,
        "8 Minutes Later": 60 * 8,
        "12 Minutes Later": 60 * 12,
        "20 Minutes Later": 60 * 20,
        "30 Minutes Later": 60 * 30,
        "1 Hour Later": 60 * 60
    ]
}

struct MessageData {
    static var groupTextfield = UITextField()
    static var nameTextfield = UITextField()
    static var numberTextfield = UITextField()
    
    static var group: [String] = ["그룹 리스트 확인","그룹 추가하기"]
    static var name: [String] = []
    static var number: [String] = []
    static var numberText: String = ""
    static var resultText: String = ""
    static var messageUserList: [String:[[String:String]]] = [:] //["TEST": [["천지운" : "01066982508"]]]
    
    static var gropuLabel = UILabel()
    static var nameLabel = UILabel()
    static var numberuLabel = UILabel()
    
    static var CGcount: CGFloat = 0
    static var count = 1
    static var padding: CGFloat = 20
    
    static var messageDefault = UserDefaults.standard
}


class ShardAudio {
    static let shared = ShardAudio()
    
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    var saveRecordAudioURL: String = "/sound5.caf"
    var savePlayAudioURL: String = ""
    
    private init() { }
    
    func setupRecord() {
        // 도큐먼트 디렉터리 확인
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0] as String
        
        // sound.caf 이름의 파일을 위한 URL 구성
        let soundFilePath = docsDir.appending(saveRecordAudioURL)
        let soundFileURL = URL(fileURLWithPath: soundFilePath)
        
        // 녹음 품질 설정
        let recordSettings = [AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
                              AVEncoderBitRateKey: 16,
                              AVNumberOfChannelsKey: 2,
                              AVSampleRateKey: 44100.0] as [String : Any]
        
        // 공유 오디오 세션 인스턴스를 반환 받는다.
        let audioSession = AVAudioSession.sharedInstance()
        do {
            // 현재 오디오 세션의 카테고리를 정한다. (재생, 녹음)
            try audioSession.setCategory(.playAndRecord)
        } catch {
            print("audioSession error: \(error.localizedDescription)")
        }
        
        // audioRecorder 인스턴스 생성
        do {
            try audioRecorder = AVAudioRecorder(url: soundFileURL, settings: recordSettings)
            audioRecorder?.prepareToRecord()
        } catch {
            print("audioSession Error: \(error.localizedDescription)")
        }
    }
}

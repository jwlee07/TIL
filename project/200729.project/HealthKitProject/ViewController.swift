//
//  ViewController.swift
//  HealthKitProject
//
//  Created by 요한/진욱 on 2020/07/29.
//  Copyright © 2020 요한. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
  
  // MARK: - Property
  private let healthStore = HKHealthStore()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    authorizeHealthKit()
    
  }
  
  // MARK: - authorizeHealthKit
  
  // 헬스 킷 사용 권한 확인
  func authorizeHealthKit() {
    
    // healthKit이 사용가능 한 디바이스인지 확인
    print(HKHealthStore.isHealthDataAvailable())
    
    // 걸음에 대한 읽고 쓰기
    let read = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
    let write = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
    
    // 걸음에 대한 읽고 쓰기의 값을 사용할 수 있는지 성공 여부
    healthStore.requestAuthorization(toShare: write, read: read) { (success, error) in
      if success == true {
        print("permisson granted")
        self.getTotalStepCount()
      }
    }
  }
  
  // MARK: - getTotalStepCount
  
  func getTotalStepCount() {
    
    // 걸음 수를 가져오기 위한 것
    guard let sampleType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
    
    // 측정하는 시작날짜와 마지막 날짜
    let startDate = Calendar.current.startOfDay(for: Date())
    let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
    
    // 걸음 수를 볼시 있는 시간 간격
    var intervar = DateComponents()
    intervar.hour = 1
    
    // query 생성
    let query = HKStatisticsCollectionQuery(
      quantityType: sampleType,
      quantitySamplePredicate: predicate,
      options: .cumulativeSum,
      anchorDate: startDate,
      intervalComponents: intervar)
    
    // healthStore로 query를 보낸다
    query.initialResultsHandler = { (sample, result, error) in
      if let myResult = result {
        myResult.enumerateStatistics(from: startDate, to: Date()) { (statistics, value) in
          if let count = statistics.sumQuantity() {
            let val = count.doubleValue(for: HKUnit.count())
            print (val)
          }
        }
      }
    }
    // query 실행
    healthStore.execute(query)
  }
}


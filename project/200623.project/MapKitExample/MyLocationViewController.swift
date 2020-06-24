//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class MyLocationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // 데이터를 받아오기 위한 delegate
    locationManager.delegate = self
    // 권한 요청
    checkAuthorizationStatus()
  }
  
  
  func checkAuthorizationStatus() {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization() // 앱이 동작할때만 실행
    case .restricted, .denied: break
    case .authorizedWhenInUse:
      fallthrough
    case .authorizedAlways:
      startUpdatingLocation()
    @unknown default: fatalError() // @ 컴파일러가 별도의 키워드로 인식하기 위한 용도, Attribute , @unknown 추가가 될지도 모른다는 것
    }
  }
  
  func startUpdatingLocation() {
    let status = CLLocationManager.authorizationStatus() // 사용자가 위치정보 서비스를 허용했는지 확인, location 서비스 가능 여부 확인
    guard status == .authorizedAlways || status == .authorizedWhenInUse,
      CLLocationManager.locationServicesEnabled()
      else { return }
    
    locationManager.desiredAccuracy = kCLLocationAccuracyBest // 위치정보의 정확도
    locationManager.distanceFilter = 10.0 // 위치정보를 요청하는 횟수
    locationManager.startUpdatingLocation()
  }
  
  @IBAction func mornitoringHeading(_ sender: Any) {
    guard CLLocationManager.headingAvailable() else { return }
    locationManager.startUpdatingHeading() // 북쪽 위치 알수 있음.
  }
  
  @IBAction func stopMornitoring(_ sender: Any) {
    locationManager.stopUpdatingHeading()
  }
}

// MARK: - CLLocationManagerDelegate
extension MyLocationViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .authorizedWhenInUse, .authorizedAlways:
      print ("Authorized")
    default:
      print ("UnAuthorized")
    }
  }
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let current = locations.last!
    let coordinate = current.coordinate // 위경도(좌표)
    
    // Span 단위가 1도
    // 경도 1도는 약 111Km, 위도 1도는 위도에 따라 다름
    // 적도 (약 111KM ) ~ 극지방 (0KM)
    
    let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001) // 보여주는 배율
    let region = MKCoordinateRegion(center: coordinate, span: span) // 지도에 보여줄 지역
    mapView.setRegion(region, animated: true) // region 출력
    mapView.showsUserLocation = true // 자신의 위치
    mapView.mapType = .hybridFlyover // 출력되는 스타일
    addAnnotation(location: current)
    
  }
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    
    print ("trueHeading : ", newHeading.trueHeading) // 진북 (항상 변하지 않는 북극점 방향)
    print ("magneticHeading : ", newHeading.magneticHeading) // 자북 (자기장이 센 북극점 방향)
  }
  
  func addAnnotation(location: CLLocation) { // 현재 나의 위치를 핀으로 표시
    let annotetion = MKPointAnnotation()
    annotetion.title = "진욱이 현재위치"
    annotetion.coordinate = location.coordinate
    mapView.addAnnotation(annotetion)
  }
}

//
//  MapMainViewController.swift
//  CafeSpot
//
//  Created by 이진욱 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import MapKit

class MapMainViewController: UIViewController {
  // MARK: - Property
  
  lazy var mapView = MKMapView()
  let locationManager = CLLocationManager()
  
  let serachTextfield: UITextField = {
    let textfield = UITextField()
    textfield.placeholder = "🔍 검색..."
    textfield.borderStyle = .roundedRect
    textfield.backgroundColor = .systemGray6
    return textfield
  }()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    hiddenNavigation()
    setupMapView()
    
  }
  // MARK: - set keyboard
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    self.view.endEditing(true)
  }
  // MARK: - setup Layout
  
  private func setupMapView() {
    
    let guide = view.safeAreaLayoutGuide
    
    let margin: CGFloat = 50
    let padding: CGFloat = 10
    
    locationManager.delegate = self
    
    checkAuthorizationStatus()
    
    [mapView, serachTextfield].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      serachTextfield.topAnchor.constraint(equalTo: view.topAnchor, constant: margin),
      serachTextfield.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding),
      serachTextfield.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding),
      serachTextfield.heightAnchor.constraint(equalToConstant: 50),
      
      mapView.topAnchor.constraint(equalTo: serachTextfield.safeAreaLayoutGuide.bottomAnchor, constant: padding),
      mapView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      mapView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      mapView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
  }
  
  // MARK: - setup MapView
  
  func checkAuthorizationStatus() {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied: break
    case .authorizedWhenInUse:
      fallthrough
    case .authorizedAlways:
      startUpdatingLocation()
    @unknown default: fatalError()
    }
  }
  
  func startUpdatingLocation() {
    let status = CLLocationManager.authorizationStatus()
    guard status == .authorizedAlways || status == .authorizedWhenInUse,
      CLLocationManager.locationServicesEnabled()
      else { return }
    
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.distanceFilter = 10.0
    locationManager.startUpdatingLocation()
  }
  
  private func hiddenNavigation() {
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.layoutIfNeeded()
  }
}
// MARK: - CLLocationManagerDelegate

extension MapMainViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let current = locations.last!
    let coordinate = current.coordinate
    
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    mapView.setRegion(region, animated: true)
    mapView.showsUserLocation = true
    addAnnotation(location: current)
    
  }
  func addAnnotation(location: CLLocation) {
    let annotetion = MKPointAnnotation()
    annotetion.coordinate = location.coordinate
    mapView.addAnnotation(annotetion)
  }
  
  
}

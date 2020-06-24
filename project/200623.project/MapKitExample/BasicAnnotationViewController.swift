//
//  BasicAnnotationViewController.swift
//  MapKitExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class BasicAnnotationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    // 시청
    let center = CLLocationCoordinate2DMake(37.566308, 126.977948)
    setRegion(coordinate: center)
  }
  
  func setRegion(coordinate: CLLocationCoordinate2D) {
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    mapView.setRegion(region, animated: true)
  }
  
  @IBAction private func addAnnotation(_ sender: Any) {
    let cityHall = MKPointAnnotation()
    cityHall.title = "시청"
    cityHall.subtitle = "서울특별시"
    cityHall.coordinate = CLLocationCoordinate2DMake(37.566308, 126.977948)
    mapView.addAnnotation(cityHall)
    
    let namsan = MKPointAnnotation()
    namsan.title = "남산"
    namsan.coordinate = CLLocationCoordinate2DMake(37.551416, 126.988194)
    mapView.addAnnotation(namsan)
    
    let gimpoAirport = MKPointAnnotation()
    gimpoAirport.title = "김포공항"
    gimpoAirport.coordinate = CLLocationCoordinate2DMake(37.559670, 126.794320)
    mapView.addAnnotation(gimpoAirport)
    
    let gangnam = MKPointAnnotation()
    gangnam.title = "강남역"
    gangnam.coordinate = CLLocationCoordinate2DMake(37.498149, 127.027623)
    mapView.addAnnotation(gangnam)
  }
  
  @IBAction private func moveToRandomPin(_ sender: Any) {
    guard mapView.annotations.count > 0 else { return }
    let random = Int.random(in: 0..<mapView.annotations.count)
    let annotation = mapView.annotations[random]
    setRegion(coordinate: annotation.coordinate)
  }
  
  @IBAction private func removeAnnotation(_ sender: Any) {
    mapView.removeAnnotations(mapView.annotations)
  }
  
  @IBAction private func setupCamera(_ sender: Any) {
    let camera = MKMapCamera()
    let coordinate = CLLocationCoordinate2DMake(37.559670, 126.794320)
    camera.centerCoordinate = coordinate
    camera.centerCoordinateDistance = 200  // 고도
    camera.pitch = 70.0  // 카메라 각도 (0일 때 수직으로 내려다보는 형태)
    camera.heading = 0   // heading: 카메라 방향 0 ~ 360 (맵을 바라보는 방향)
    mapView.setCamera(camera, animated: true)
  }
}

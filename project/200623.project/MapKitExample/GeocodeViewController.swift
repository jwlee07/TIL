//
//  GeocodeViewController.swift
//  MapKitExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit


final class GeocodeViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {
    let touchPoint = gesture.location(in: gesture.view)
    let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
    let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    
    reverseGeocode(location: location)
  }
  func reverseGeocode(location: CLLocation) {
    let geocoder = CLGeocoder()
    
    geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
      if error != nil {
        return print (error!.localizedDescription)
      }
      
      // 국가별 주소체계에 따라 어떤 속성 값을 가질지 모름
      guard let address = placeMark?.first,
        let country = address.country, // 대한민국
        let administrativeArea = address.administrativeArea, // 서울특별시
        let locality = address.locality, // 서초구, 광명시
        let name = address.name // 방배동 312-22, 신림동 456-33
        else { return }
      
      let addr = "\(country) \(administrativeArea) \(locality) \(name)"
      print (addr)
    }
  }
  func geocodeAddressString (_ addressString: String) {
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(addressString) { (placeMark, error) in
      if error != nil {
        return print (error!.localizedDescription)
      }
      guard let place = placeMark?.first else { return }
      print ("place.location?.coordinate : ", place.location?.coordinate)
    }
  }
}

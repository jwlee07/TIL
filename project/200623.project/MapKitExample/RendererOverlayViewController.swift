//
//  RendererOverlayViewController.swift
//  MapKitExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class RendererOverlayViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction func addCircle(_ sender: Any) {
    let center = mapView.centerCoordinate
    // 44000m = 44km
    let circle = MKCircle(center: center, radius: 44000)
    mapView.addOverlay(circle)
  }
  
  @IBAction func addStar(_ sender: Any) {
    let center = mapView.centerCoordinate
    
    var point1 = center; point1.latitude += 0.4
    var point2 = center; point2.longitude += 0.32;   point2.latitude -= 0.30
    var point3 = center; point3.longitude -= 0.45;  point3.latitude += 0.15
    var point4 = center; point4.longitude += 0.45;  point4.latitude += 0.15
    var point5 = center; point5.longitude -= 0.32;   point5.latitude -= 0.30
    
    let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point5, point1]
    let polyline = MKPolyline(coordinates: points, count: points.count)
    
    mapView.addOverlay(polyline)
    
  }
  
  @IBAction private func removeOverlays(_ sender: Any) {
    mapView.removeOverlays(mapView.overlays)
  }
}

// MARK: -
extension RendererOverlayViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let circle = overlay as? MKCircle {
      let renderer = MKCircleRenderer(circle: circle)
      renderer.strokeColor = UIColor.blue
      renderer.lineWidth = 2
      return renderer
    }
    if let polyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: polyline)
      renderer.lineWidth = 2
      renderer.strokeColor = .red
      return renderer
    }
    return MKOverlayRenderer(overlay: overlay)
  }
}

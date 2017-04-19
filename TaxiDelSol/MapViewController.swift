//
//  SecondViewController.swift
//  TaxiDelSol
//
//  Created by Efim Polevoi on 14/04/2017.
//  Copyright © 2017 Efim Polevoi. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

  @IBOutlet weak var mapView: MKMapView!
  var locationManager: CLLocationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.mapView.delegate = self
    self.locationManager.delegate = self
    self.locationManager.requestWhenInUseAuthorization()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    guard status == .authorizedWhenInUse else {
      // Notify user with alert
      let ac = UIAlertController(title: "Location disabled", message: "Enable location services in the Settings app", preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "OK", style: .default))
      return
    }
    self.mapView.showsUserLocation = true
  }

  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    // Center the map
    //static var centerMapFirstTime: dispatch_once_t
    
    if userLocation.coordinate.latitude != 0.0 && userLocation.coordinate.longitude != 0.0 {
      self.mapView.setCenter(userLocation.coordinate, animated: true)
    }
  }
}


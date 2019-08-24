//
//  ViewController.swift
//  WorkingMapKit
//
//  Created by Georgi Malkhasyan on 8/23/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//GET PERMISSION TO SHOW USER LOCATION
//SHOW USER LOCATION ON THE MAP

class MapScreen: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

 
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }else{
        }
    }

    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            break
        case .denied:
            //Show alert instructiong them how to tern on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            //Show alert letting them khow
            break
        case .authorizedAlways:
            break
        }

    }
}

extension MapScreen: CLLocationManagerDelegate {
    //UPDATE USER LOCATION AS THEY MOVE
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        <#code#>
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        <#code#>
//    }
}

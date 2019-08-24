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
    let regionMeters = 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }else{
            //
        }
    }
    

    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    
    //MARK: Center user Loscation and zoome
    func  centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: CLLocationDistance(regionMeters), longitudinalMeters: CLLocationDistance(regionMeters))
            mapView.setRegion(region, animated: true)
        }
    }
 
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
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

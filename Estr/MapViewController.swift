//
//  MapViewController.swift
//  Estr
//
//  Created by auston salvana on 2015-11-07.
//  Copyright © 2015 ARJHack. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var currentLocation:CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        mapView.showsUserLocation = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //        if let manager = locationManager {
        //            setupMap()
        //        }
    }
    
    //MARK: CoreLocation delegate methods
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        
        let annotation = MKPointAnnotation()
        annotation.title = "Borquin Clinic"
        annotation.subtitle = "Abbotsford, BC, Canada"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 49.0546, longitude: -122.4)
        
        let annotation2 = MKPointAnnotation()
        annotation2.title = "Goose University"
        annotation2.subtitle = "Who dafuq cares"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 47.0546, longitude: -122.4)
        
        let annotation3 = MKPointAnnotation()
        annotation3.title = "USF"
        annotation3.subtitle = "States"
        annotation3.coordinate = CLLocationCoordinate2D(latitude: 50.0546, longitude: -123.4)

        mapView.showAnnotations([annotation, annotation2, annotation3], animated: true)
        print("update location")
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch (status) {
            
        case .NotDetermined:
            print("User still thinking..")
        case .Denied:
            print("User hates you")
        case .AuthorizedWhenInUse:
            print("authorize while in use")
            
        case .AuthorizedAlways:
            locationManager.startUpdatingLocation()
            print("start updatiing")
        default:
            print("\(status)")
            
        }
        
    }
    
    //MARK: helper methods
    
    func setupMap() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 500
        
        locationManager.startUpdatingLocation()
        print("called startUpdating!")
    }
    
}
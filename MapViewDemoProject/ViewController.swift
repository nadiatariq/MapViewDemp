//
//  ViewController.swift
//  MapViewDemoProject
//
//  Created by sameeltariq on 03/09/2022.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let stadiums = [Stadium(name: "Emirates Stadium", lattitude: 51.5549, longitude: -0.108436 ),
                        Stadium(name: "Stamford Bridge", lattitude:  51.4816, longitude: -0.191034),
                        Stadium(name: "White Hart Lane", lattitude: 51.6033, longitude: -0.065684),
                        Stadium(name: "Olympic Stadium", lattitude: 51.5383, longitude: -0.016587),
                        Stadium(name: "Old Trafford", lattitude: 53.4631, longitude: -2.29139),
                        Stadium(name: "Anfield", lattitude: 53.4308, longitude: -2.96096)]
        
        checkLocationService()
        fetchStadiumsOnMap(stadiums)
        // Do any additional setup after loading the view.
//        if CLLocationManager.locationServicesEnabled(){
//
//        }else{
//
//        }
    }
    func checkLocationService(){
        if CLLocationManager.locationServicesEnabled(){
            checkAuthorizationStatus()
        }else{
            
        }
    }
    
    // have cases that we handel,. three are basics and remaing depends on situation
    func checkAuthorizationStatus(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedAlways :
            mapView.showsUserLocation = true
            // The user authorized the app to start location services at any time.
        case .notDetermined: // The user has not chosen whether the app can use location services.
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
        case .restricted: //The app is not authorized to use location services.
            break
        case .denied: // The user denied the use of location services for the app or they are disabled globally in Settings.
            break
        case .authorizedWhenInUse: // The user authorized the app to start location services while it is in use.
            break
            
        }
    }
    
    func fetchStadiumsOnMap(_ stadiums: [Stadium]){
        for stadium in stadiums {
            let annotation = MKPointAnnotation()
            annotation.title = stadium.name
            annotation.coordinate  = CLLocationCoordinate2D(latitude: stadium.lattitude, longitude: stadium.longitude)
            mapView.addAnnotation(annotation)
        }
        
        
    }
}

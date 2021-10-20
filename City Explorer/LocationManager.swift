//
//  LocationManager.swift
//  City Explorer
//
//  Created by macbook on 2021/10/13.
//

import Foundation
import MapKit

class LocationManager: ObservableObject {
    @Published var currentRegion = MKCoordinateRegion(center: CLLocation(latitude: -26.270760, longitude: 28.112268).coordinate, latitudinalMeters: CLLocationDistance(10000), longitudinalMeters: CLLocationDistance(10000))
    
    var userLocationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    
    init(){
        requestPermission()
        guard let userLocation = userLocationManager.location?.coordinate else {return}
        currentRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: CLLocationDistance(10000), longitudinalMeters: CLLocationDistance(10000))
    }
    
    func requestPermission(){
        if self.authorizationStatus == .notDetermined {
            self.userLocationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
    
    func goToUserLocation(){
        guard let userLocation = userLocationManager.location?.coordinate else {return}
        currentRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: CLLocationDistance(10000), longitudinalMeters: CLLocationDistance(10000))
    }
}

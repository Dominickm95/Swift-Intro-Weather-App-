//
//  Location Manager.swift
//  Order System 1.1
//
//  Created by Dominick Mason on 3/31/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    // calls the location request
    func requestLocation () {
        isLoading = true
        manager.requestLocation()
    }
    //reads and displays location data
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    //throws error message and resets loading variable
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error Getting Your Location, Please Try Again. ")
        isLoading = false
    }
}

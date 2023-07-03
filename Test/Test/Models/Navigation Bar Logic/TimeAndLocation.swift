//
//  TimeAndLocation.swift
//  Test
//
//  Created by Гаджи Герейакаев on 29.06.2023.
//

import Foundation
import CoreLocation
import MapKit


func getCurrentDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_RU")
    dateFormatter.dateFormat = "d MMMM, y"
    let currentDate = Date()
    
    let formattedDate = dateFormatter.string(from: currentDate)
    return formattedDate
}

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func reverseGeocodeLocation(_ location: CLLocation, completion: @escaping (String?) -> Void) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            guard let placemark = placemarks?.first,
                  let city = placemark.locality else {
                completion(nil)
                return
            }
            
            completion(city)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            reverseGeocodeLocation(location) { (city) in
                if let city = city {
                    DispatchQueue.main.async {
                        self.userCity = city
                    }
                } else {
                    DispatchQueue.main.async {
                        self.userCity = "Failed to get city"
                    }
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.userCity = "Failed to get location: \(error.localizedDescription)"
        }
    }
    
    @Published var userCity: String = "Определяем местоположение"
}

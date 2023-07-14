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
    dateFormatter.locale = Locale(identifier: "ru_RU") // Устанавливаем локаль для использования русских названий месяцев
    dateFormatter.dateFormat = "d MMMM, y" // Устанавливаем формат даты
    let currentDate = Date() // Получаем текущую дату
    
    let formattedDate = dateFormatter.string(from: currentDate) // Преобразуем дату в строку с указанным форматом
    return formattedDate
}

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var userCity: String = "Определяем местоположение" // Опубликованное свойство, хранящее название города пользователя
    
    override init() {
        super.init()
        locationManager.delegate = self // Устанавливаем делегата CLLocationManagerDelegate
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization() // Запрашиваем разрешение на использование местоположения
        locationManager.requestLocation() // Запрашиваем текущее местоположение
    }
    
    func reverseGeocodeLocation(_ location: CLLocation, completion: @escaping (String?) -> Void) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            guard let placemark = placemarks?.first,
                  let city = placemark.locality else {
                completion(nil) // Если город не найден, передаем nil в замыкание completion
                return
            }
            
            completion(city) // Если город найден, передаем его в замыкание completion
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            reverseGeocodeLocation(location) { (city) in
                if let city = city {
                    DispatchQueue.main.async {
                        self.userCity = city // Обновляем свойство userCity с найденным городом на главной очереди
                    }
                } else {
                    DispatchQueue.main.async {
                        self.userCity = "Failed to get city" // Если город не найден, обновляем свойство userCity с сообщением об ошибке на главной очереди
                    }
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.userCity = "Failed to get location: \(error.localizedDescription)" // Обновляем свойство userCity с сообщением об ошибке получения местоположения на главной очереди
        }
    }
}


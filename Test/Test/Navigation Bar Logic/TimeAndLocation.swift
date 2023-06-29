//
//  TimeAndLocation.swift
//  Test
//
//  Created by Гаджи Герейакаев on 29.06.2023.
//

import Foundation
import CoreLocation

func getCurrentDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_RU")
    dateFormatter.dateFormat = "d MMMM, y"
    let currentDate = Date()
    
    let formattedDate = dateFormatter.string(from: currentDate)
    return formattedDate
}



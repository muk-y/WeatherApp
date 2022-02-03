//
//  EndPoint.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import Foundation

enum Endpoint {
    
    case fetchWeather(city: String, unit: Unit = .celsius)
    
    var path: String {
        switch self {
        case .fetchWeather(let city, let unit):
            return "weather?q=\(city)&units=\(unit.rawValue)"
        }
    }
    
}

enum Unit: String {
    
    case fahrenheit = "imperial"
    case celsius = "metric"
    case kelvin = "standard"
    
}

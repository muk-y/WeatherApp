//
//  EndPoint.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import Foundation

enum Endpoint {
    
    case fetchCityWeather(city: String, unit: Unit = .celsius)
    case fetchWeather(id: Int, unit: Unit = .celsius)
    
    var path: String {
        switch self {
        case .fetchCityWeather(let city, let unit):
            return "weather?q=\(city)&units=\(unit.rawValue)"
        case .fetchWeather(let id, let unit):
            return "weather?id=\(id)&units=\(unit.rawValue)"
        }
    }
    
}

enum Unit: String {
    
    case fahrenheit = "imperial"
    case celsius = "metric"
    case kelvin = "standard"
    
}

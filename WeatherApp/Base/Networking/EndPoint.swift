//
//  EndPoint.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import Foundation

enum Endpoint {
    
    case fetchWeather(city: String)
    
    var path: String {
        switch self {
        case .fetchWeather(let city):
            return "weather?q=\(city)"
        }
    }
    
}

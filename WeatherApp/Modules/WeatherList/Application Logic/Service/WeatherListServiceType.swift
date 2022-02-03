//
//  WeatherListServiceType.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//
//

import Foundation

protocol WeatherListServiceType: AnyObject {
    
    func fetchWeatherData(of city: String, completion: @escaping (Result<WeatherData, Error>) -> ())
    
}

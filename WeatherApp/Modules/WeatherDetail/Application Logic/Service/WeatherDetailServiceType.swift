//
//  WeatherDetailServiceType.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//
//

import Foundation

protocol WeatherDetailServiceType: AnyObject {
    
    func fetchWeather(of id: Int, completion: @escaping (Result<WeatherData, Error>) -> ())
    
}

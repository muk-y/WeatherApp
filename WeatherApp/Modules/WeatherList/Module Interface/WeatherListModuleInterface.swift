//
//  WeatherListModuleInterface.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//
//

protocol WeatherListModuleInterface: AnyObject {
    
    func viewIsReady()
    func searchWeather(for location: String?)
    func weatherDetail(of index: Int)
    
}

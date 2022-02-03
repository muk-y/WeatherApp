//
//  WeatherDetailModuleInterface.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//
//

protocol WeatherDetailModuleInterface: AnyObject {
    
    func viewIsReady()
    func favourite(_ status: Bool?)
    
}

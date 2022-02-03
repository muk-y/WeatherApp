//
//  WeatherListViewInterface.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//
//

protocol WeatherListViewInterface: AnyObject, BaseViewInterface {
    
    func show(_ models: [WeatherListViewModel])
    
}

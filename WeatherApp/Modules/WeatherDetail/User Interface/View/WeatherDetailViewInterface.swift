//
//  WeatherDetailViewInterface.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//
//

protocol WeatherDetailViewInterface: AnyObject, BaseViewInterface {
    
    func show(_ model: WeatherDetailViewModel)
    
}

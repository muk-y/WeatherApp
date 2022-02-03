//
//  WeatherDetailPresenter.swift
//  WeatherApp
//
//  Created by ekmacmini43 on 03/02/2022.
//
//

import Foundation

class WeatherDetailPresenter {
    
	// MARK: Properties
    weak var view: WeatherDetailViewInterface?
    var interactor: WeatherDetailInteractorInput?
    var wireframe: WeatherDetailWireframeInput?

    // MARK: Converting entities
    
}

// MARK: WeatherDetail module interface
extension WeatherDetailPresenter: WeatherDetailModuleInterface {
    
}

// MARK: WeatherDetail interactor output interface
extension WeatherDetailPresenter: WeatherDetailInteractorOutput {
    
}

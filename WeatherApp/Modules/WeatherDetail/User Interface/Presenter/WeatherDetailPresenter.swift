//
//  WeatherDetailPresenter.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//
//

import Foundation

class WeatherDetailPresenter {
    
	// MARK: Properties
    weak var view: WeatherDetailViewInterface?
    var interactor: WeatherDetailInteractorInput?
    var wireframe: WeatherDetailWireframeInput?

    // MARK: Converting entities
    private func convert(_ model: WeatherDetailStructure) -> WeatherDetailViewModel {
        return WeatherDetailViewModel(location: model.location,
                                      temperature: model.temperature,
                                      windSpeed: model.windSpeed,
                                      humidity: model.humidity,
                                      weatherCondition: model.weatherCondition,
                                      weatherConditionIcon: model.weatherConditionIcon,
                                      isFavourite: model.isFavourite)
    }
    
}

// MARK: WeatherDetail module interface
extension WeatherDetailPresenter: WeatherDetailModuleInterface {
    
    func viewIsReady() {
        interactor?.getData()
    }
    
    func favourite(_ status: Bool?) {
        interactor?.favourite(status)
    }
    
}

// MARK: WeatherDetail interactor output interface
extension WeatherDetailPresenter: WeatherDetailInteractorOutput {
    
    func obtained(_ model: WeatherDetailStructure) {
        view?.show(convert(model))
    }
    
    func obtained(_ error: Error) {
        view?.alert(message: error.localizedDescription)
    }
    
}

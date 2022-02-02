//
//  WeatherListPresenter.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//
//

import Foundation

class WeatherListPresenter {
    
	// MARK: Properties
    weak var view: WeatherListViewInterface?
    var interactor: WeatherListInteractorInput?
    var wireframe: WeatherListWireframeInput?

    // MARK: Converting entities
    private func convert(_ models: [WeatherListStructure]) -> [WeatherListViewModel] {
        return models.map({WeatherListViewModel(location: $0.location,
                                                weatherCondition: $0.weatherCondition,
                                                weatherConditionIcon: $0.weatherConditionIcon)})
    }
    
}

 // MARK: WeatherList module interface
extension WeatherListPresenter: WeatherListModuleInterface {
    
    func viewIsReady() {
        interactor?.getData()
    }
    
}

// MARK: WeatherList interactor output interface
extension WeatherListPresenter: WeatherListInteractorOutput {
    
    func obtained(_ models: [WeatherListStructure]) {
        view?.show(convert(models))
    }
    
    func obtained(_ error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
}

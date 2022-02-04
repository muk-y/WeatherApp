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
                                                country: $0.country,
                                                temperature: $0.temperature,
                                                weatherConditionIcon: $0.weatherConditionIcon)})
    }
    
}

 // MARK: WeatherList module interface
extension WeatherListPresenter: WeatherListModuleInterface {
    
    func viewIsReady() {
        view?.showLoading()
        interactor?.getData()
    }
    
    func searchWeather(for location: String?) {
        view?.showLoading()
        interactor?.searchWeather(for: location)
    }
    
    func weatherDetail(of index: Int) {
        wireframe?.openWeatherDetail()
        interactor?.sendWeatherData(of: index)
    }
    
}

// MARK: WeatherList interactor output interface
extension WeatherListPresenter: WeatherListInteractorOutput {
    
    func obtained(_ models: [WeatherListStructure]) {
        view?.hideLoading()
        view?.show(convert(models))
    }
    
    func obtainedSearchSuccess() {
        view?.hideLoading()
        wireframe?.openWeatherDetail()
    }
    
    func obtained(_ error: Error) {
        view?.hideLoading()
        view?.alert(message: error.localizedDescription)
    }
    
}

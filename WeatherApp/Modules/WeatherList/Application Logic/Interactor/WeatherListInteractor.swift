//
//  WeatherListInteractor.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//
//

import Foundation

class WeatherListInteractor {
    
	// MARK: Properties
    weak var output: WeatherListInteractorOutput?
    private let service: WeatherListServiceType
    private var cities = ["Kathmandu", "Pokhara", "Ilam"]
    private let dispatchGroup = DispatchGroup()
    private var models: [WeatherData] = []
    
    // MARK: Initialization
    init(service: WeatherListServiceType) {
        self.service = service
    }

    // MARK: Converting entities
    private func convert(_ models: [WeatherData]) -> [WeatherListStructure] {
        return models.map({WeatherListStructure(location: $0.location,
                                                weatherCondition: $0.weatherConditions?.first?.title,
                                                weatherConditionIcon: $0.weatherConditions?.first?.icon)})
    }
    
}

// MARK: WeatherList interactor input interface
extension WeatherListInteractor: WeatherListInteractorInput {
    
    func getData() {
        models.removeAll()
        cities.forEach({
            dispatchGroup.enter()
            service.fetchWeatherData(of: $0) { [weak self] result in
                switch result {
                case .success(let weatherData):
                    self?.models.append(weatherData)
                    self?.dispatchGroup.leave()
                case .failure(let error):
                    self?.output?.obtained(error)
                    self?.dispatchGroup.leave()
                }
            }
        })
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.output?.obtained(self?.convert(self?.models ?? []) ?? [])
        }
        
    }
    
}

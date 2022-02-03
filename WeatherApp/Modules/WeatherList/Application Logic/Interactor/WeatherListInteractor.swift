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
    private let dispatchGroup = DispatchGroup()
    private var models: [WeatherData] = []
    
    // MARK: Initialization
    init(service: WeatherListServiceType) {
        self.service = service
    }
    
    // MARK: Converting entities
    private func convert(_ models: [WeatherData]) -> [WeatherListStructure] {
        models.map{
            let temperature = $0.main?.temperature
            let iconName = $0.weatherConditions?.first?.icon
            return WeatherListStructure(location: $0.location,
                                        country: $0.sys?.country,
                                        temperature: temperature == nil ? "N/A" : "\(temperature ?? .zero)° C",
                                        weatherConditionIcon: iconName == nil ? nil : "\(GlobalConstants.IMAGE_BASE_URL)\(iconName ?? "")@2x.png")}
    }
    
}

// MARK: WeatherList interactor input interface
extension WeatherListInteractor: WeatherListInteractorInput {
    
    func getData() {
        models.removeAll()
        let cities = GlobalConstants.requiredLocations
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
    
    func searchWeather(for location: String?) {
        guard let location = location else { return }
        service.fetchWeatherData(of: location) { [weak self] result in
            switch result {
            case .success(let weatherData):
                if let message = weatherData.message {
                    self?.output?.obtained(NSError(domain: "error", code: 22, userInfo: [NSLocalizedDescriptionKey: message]))
                    return
                }
                self?.output?.obtainedSearchSuccess()
                GlobalConstants.Notification.didGetWeather.fire(with: weatherData)
            case .failure(let error):
                self?.output?.obtained(error)
            }
        }
    }
    
    func sendWeatherData(of index: Int) {
        if let model = models.elementAt(index: index) {
            GlobalConstants.Notification.didGetWeather.fire(with: model)
        }
    }
    
}

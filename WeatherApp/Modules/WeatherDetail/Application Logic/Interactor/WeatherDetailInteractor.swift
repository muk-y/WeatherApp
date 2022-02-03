//
//  WeatherDetailInteractor.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//
//

import Foundation

class WeatherDetailInteractor {
    
	// MARK: Properties
    weak var output: WeatherDetailInteractorOutput?
    private let service: WeatherDetailServiceType
    private var model: WeatherData?
    
    // MARK: Initialization
    init(service: WeatherDetailServiceType) {
        self.service = service
        NotificationCenter.default.addObserver(self, selector: #selector(didGetWeather(_:)), name: GlobalConstants.Notification.didGetWeather.notificationName, object: nil)
    }

    // MARK: Converting entities
    private func convert(_ model: WeatherData) -> WeatherDetailStructure {
        let temperature = model.main?.temperature
        let iconName = model.weatherConditions?.first?.icon
        let windSpeed = model.wind?.speed
        let humidity = model.main?.humidity
        return WeatherDetailStructure(location: model.location,
                                      temperature: temperature == nil ? "N/A" : "\(temperature ?? .zero)° C",
                                      windSpeed: windSpeed == nil ? "N/A" : "\(windSpeed ?? .zero) m/s",
                                      humidity: humidity == nil ? "N/A" : "\(humidity ?? .zero)%",
                                      weatherConditionIcon: iconName == nil ? nil : "\(GlobalConstants.IMAGE_BASE_URL)\(iconName ?? "")@2x.png")
    }
    
    //MARK: Other functions
    @objc private func didGetWeather(_ notification: Notification) {
        if let model = notification.object as? WeatherData {
            self.model = model
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

// MARK: WeatherDetail interactor input interface
extension WeatherDetailInteractor: WeatherDetailInteractorInput {
    
    func getData() {
        if let model = model {
            output?.obtained(convert(model))
        }
    }
    
}

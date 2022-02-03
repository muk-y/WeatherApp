//
//  WeatherDetailInteractor.swift
//  WeatherApp
//
//  Created by ekmacmini43 on 03/02/2022.
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
    
}

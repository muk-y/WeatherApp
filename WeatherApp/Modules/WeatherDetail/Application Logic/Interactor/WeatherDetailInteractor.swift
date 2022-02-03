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
    private var timer: Timer? {
        didSet {
            oldValue?.invalidate()
        }
    }
    
    // MARK: Initialization
    init(service: WeatherDetailServiceType) {
        self.service = service
        NotificationCenter.default.addObserver(self, selector: #selector(didGetWeather(_:)), name: GlobalConstants.Notification.didGetWeather.notificationName, object: nil)
        timer = Timer.scheduledTimer(withTimeInterval: 60 * GlobalConstants.refreshingMinInterval, repeats: true, block: { [weak self] _ in
            self?.refreshData()
        })
    }

    // MARK: Converting entities
    private func convert(_ model: WeatherData) -> WeatherDetailStructure {
        let temperature = model.main?.temperature
        let windSpeed = model.wind?.speed
        let humidity = model.main?.humidity
        let weatherCondition = model.weatherConditions?.first
        let favouriteCities = UserDefaults.standard.stringArray(forKey: GlobalConstants.UserDefaultsKey.favouriteCities) ?? []
        return WeatherDetailStructure(location: model.location,
                                      temperature: temperature == nil ? "N/A" : "\(temperature ?? .zero)° C",
                                      windSpeed: windSpeed == nil ? "N/A" : "\(windSpeed ?? .zero) m/s",
                                      humidity: humidity == nil ? "N/A" : "\(humidity ?? .zero)%",
                                      weatherCondition: weatherCondition?.title,
                                      weatherConditionIcon: weatherCondition?.icon == nil ? nil : "\(GlobalConstants.IMAGE_BASE_URL)\(weatherCondition?.icon ?? "")@2x.png",
                                      isFavourite: GlobalConstants.requiredLocations.contains(model.location ?? "") || model.location == "Ilām" ? nil : favouriteCities.contains(model.location ?? ""))
    }
    
    //MARK: Other functions
    @objc private func didGetWeather(_ notification: Notification) {
        if let model = notification.object as? WeatherData {
            self.model = model
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        timer = nil
    }
    
}

// MARK: WeatherDetail interactor input interface
extension WeatherDetailInteractor: WeatherDetailInteractorInput {
    
    func getData() {
        if let model = model {
            output?.obtained(convert(model))
        }
    }
    
    func refreshData() {
        if let id = model?.id {
            service.fetchWeather(of: id) { [weak self] result in
                switch result {
                case .success(let weatherData):
                    if let message = weatherData.message {
                        self?.output?.obtained(NSError(domain: "error", code: 22, userInfo: [NSLocalizedDescriptionKey: message]))
                        return
                    }
                    self?.model = weatherData
                case .failure(let error):
                    self?.output?.obtained(error)
                }
            }
        }
    }
    
    func favourite(_ status: Bool?) {
        if let isFavourite = status,
           let model = model,
           let location = model.location {
            var favouriteCities = UserDefaults.standard.stringArray(forKey: GlobalConstants.UserDefaultsKey.favouriteCities) ?? []
            if isFavourite && !favouriteCities.contains(location) {
                favouriteCities.append(location)
            } else if let index = favouriteCities.firstIndex(where: {$0 == location}) {
                favouriteCities.remove(at: index)
            }
            UserDefaults.standard.setValue(favouriteCities, forKey: GlobalConstants.UserDefaultsKey.favouriteCities)
            GlobalConstants.Notification.didGetWeather.fire(with: (weather: model, status: isFavourite))
        }
    }
    
}

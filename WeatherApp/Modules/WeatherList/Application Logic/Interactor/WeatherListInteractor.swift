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
    private var timer: Timer? {
        didSet {
            oldValue?.invalidate()
        }
    }
    
    // MARK: Initialization
    init(service: WeatherListServiceType) {
        self.service = service
        NotificationCenter.default.addObserver(self, selector: #selector(didGetWeather(_:)), name: GlobalConstants.Notification.didGetWeather.notificationName, object: nil)
        timer = Timer.scheduledTimer(withTimeInterval: 60 * GlobalConstants.refreshingMinInterval, repeats: true, block: { [weak self] _ in
            self?.getData()
        })
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
    
    //MARK: Other functions
    @objc private func didGetWeather(_ notification: Notification) {
        if let weatherTuple = notification.object as? (weather: WeatherData, status: Bool) {
            if weatherTuple.status && !models.contains(where: {$0.id == weatherTuple.weather.id}) {
                models.append(weatherTuple.weather)
            } else if let index = models.firstIndex(where: {$0.id == weatherTuple.weather.id}) {
                models.remove(at: index)
            }
            output?.obtained(convert(models))
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        timer = nil
    }
    
}

// MARK: WeatherList interactor input interface
extension WeatherListInteractor: WeatherListInteractorInput {
    
    func getData() {
        models.removeAll()
        var citiesID = DataManager.requiredLocationsID
        citiesID.append(contentsOf: DataManager.favouriteCitiesID)
        citiesID.forEach({
            dispatchGroup.enter()
            service.fetchWeatherData(city: nil, id: $0) { [weak self] result in
                switch result {
                case .success(let weatherData):
                    if let message = weatherData.message {
                        self?.output?.obtained(NSError(domain: "error", code: 22, userInfo: [NSLocalizedDescriptionKey: message]))
                        self?.dispatchGroup.leave()
                        return
                    }
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
        service.fetchWeatherData(city: location, id: nil) { [weak self] result in
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

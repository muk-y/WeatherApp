//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 03/02/2022.
//
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    // MARK: Properties
    var presenter: WeatherDetailModuleInterface?
    private var viewModel: WeatherDetailViewModel? {
        didSet {
            setData()
        }
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var locationLabel: UILabel?
    @IBOutlet weak var weatherConditionIconImageView: UIImageView?
    @IBOutlet weak var weatherConditionContainerView: UIView?
    @IBOutlet weak var weatherConditionLabel: UILabel?
    @IBOutlet weak var temperatureLabel: UILabel?
    @IBOutlet weak var windSpeedLabel: UILabel?
    @IBOutlet weak var humidityLabel: UILabel?
    
    // MARK: VC's Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewIsReady()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    private func setup() {
        // all setup should be done here
    }
    
    private func setData() {
        locationLabel?.text = viewModel?.location
        weatherConditionIconImageView?.showImage(with: viewModel?.weatherConditionIcon)
        temperatureLabel?.text = viewModel?.temperature
        windSpeedLabel?.text = viewModel?.windSpeed
        humidityLabel?.text = viewModel?.humidity
    }
    
}

// MARK: WeatherDetailViewInterface
extension WeatherDetailViewController: WeatherDetailViewInterface {
    
    func show(_ model: WeatherDetailViewModel) {
        viewModel = model
    }
    
}

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Weather Detail"
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    private func setup() {
        setupView()
        setupLabel()
    }
    
    private func setupView() {
        view.backgroundColor = .primary
        weatherConditionContainerView?.backgroundColor = .secondary
        weatherConditionContainerView?.capsuled()
    }
    
    private func setupLabel() {
        locationLabel?.font = CustomFont.regular.of(.heading1)
        weatherConditionLabel?.font = CustomFont.regular.of(.heading3)
        temperatureLabel?.font = CustomFont.bold.of(.customHeading(size: 30))
        [windSpeedLabel,
         humidityLabel].forEach({
            $0?.font = CustomFont.regular.of(.heading4)
            $0?.textColor = UIColor.white.withAlphaComponent(0.7)
        })
        [locationLabel,
         temperatureLabel,
         weatherConditionLabel].forEach({
            $0?.textColor = .white
        })
    }
    
    private func setData() {
        locationLabel?.text = viewModel?.location
        weatherConditionLabel?.text = viewModel?.weatherCondition
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

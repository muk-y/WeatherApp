//
//  WeatherListTableViewCell.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import UIKit

class WeatherListTableViewCell: UITableViewCell {
    
    //MARK: Properties
    var viewModel: WeatherListViewModel? {
        didSet {
            setData()
        }
    }
    
    //MARK: Outlets
    @IBOutlet weak var containerView: UIView?
    @IBOutlet weak var temperatureLabel: UILabel?
    @IBOutlet weak var locationLabel: UILabel?
    @IBOutlet weak var countryLabel: UILabel?
    @IBOutlet weak var weatherImageView: UIImageView?
    
    //MARK: Cell functions
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    //MARK: Other functions
    private func setup() {
        backgroundColor = .clear
        setupView()
        setupLabel()
    }
    
    private func setupView() {
        containerView?.backgroundColor = UIColor(hex: "#8F96FF").withAlphaComponent(0.33)
        containerView?.curve = 12
    }
    
    private func setupLabel() {
        [temperatureLabel,
         locationLabel,
        countryLabel].forEach({
            $0?.textColor = $0 == countryLabel ? UIColor.white.withAlphaComponent(0.7) : .white
        })
    }
    
    private func setData() {
        print("Temp: \(viewModel?.temperature ?? "")")
        temperatureLabel?.text = viewModel?.temperature
        locationLabel?.text = viewModel?.location
        countryLabel?.text = viewModel?.country
    }

}

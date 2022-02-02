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
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var weatherLabel: UILabel?
    @IBOutlet weak var weatherImageView: UIImageView?
    
    //MARK: Other functions
    private func setData() {
        titleLabel?.text = viewModel?.location
        weatherLabel?.text = viewModel?.weatherCondition
    }

}

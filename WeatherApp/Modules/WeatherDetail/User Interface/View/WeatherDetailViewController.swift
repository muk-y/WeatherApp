//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by ekmacmini43 on 03/02/2022.
//
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    // MARK: Properties
    var presenter: WeatherDetailModuleInterface?
    
    // MARK: IBOutlets
    
    // MARK: VC's Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    private func setup() {
        // all setup should be done here
    }
    
}

// MARK: WeatherDetailViewInterface
extension WeatherDetailViewController: WeatherDetailViewInterface {
    
}

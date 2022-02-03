//
//  WeatherDetailWireframe.swift
//  WeatherApp
//
//  Created by ekmacmini43 on 03/02/2022.
//
//

import UIKit

class WeatherDetailWireframe {
     weak var view: UIViewController!
}

extension WeatherDetailWireframe: WeatherDetailWireframeInput {
    
    var storyboardName: String {return "WeatherDetail"}
    
    func getMainView() -> UIViewController {
        let service = WeatherDetailService()
        let interactor = WeatherDetailInteractor(service: service)
        let presenter = WeatherDetailPresenter()
        let viewController = viewControllerFromStoryboard(of: WeatherDetailViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}

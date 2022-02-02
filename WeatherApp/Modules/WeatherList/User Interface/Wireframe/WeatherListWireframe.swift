//
//  WeatherListWireframe.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//
//

import UIKit

class WeatherListWireframe {
     weak var view: UIViewController!
}

extension WeatherListWireframe: WeatherListWireframeInput {
    
    var storyboardName: String {return "WeatherList"}
    
    func getMainView() -> UIViewController {
        let service = WeatherListService()
        let interactor = WeatherListInteractor(service: service)
        let presenter = WeatherListPresenter()
        let viewController = viewControllerFromStoryboard(of: WeatherListViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}

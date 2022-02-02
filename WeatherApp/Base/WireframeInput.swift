//
//  WireframeInput.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import UIKit

protocol WireframeInput {
    
    var window: UIWindow? { get }
    var view: UIViewController! { get }
    var storyboardName: String { get }
    func getMainView() -> UIViewController
    
}

extension WireframeInput {
    
    var window: UIWindow? {
        return UIApplication.shared.windows.first
    }
    
    func viewControllerFromStoryboard<T: UIViewController>(of type: T.Type) -> T {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
    
}

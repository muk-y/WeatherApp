//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureNavBar()
        return true
    }
    
    private func configureNavBar() {
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = .secondary
        appearance.tintColor = .white
        appearance.titleTextAttributes = [NSAttributedString.Key.font: CustomFont.regular.of(.heading1),
                                          NSAttributedString.Key.foregroundColor: UIColor.white]
    }

}


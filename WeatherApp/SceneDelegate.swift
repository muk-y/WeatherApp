//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by Mukesh Shakya on 2/2/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        window?.rootViewController = UINavigationController(rootViewController: WeatherListWireframe().getMainView())
    }

}

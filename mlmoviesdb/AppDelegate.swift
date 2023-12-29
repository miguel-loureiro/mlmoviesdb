//
//  AppDelegate.swift
//  mlmoviesdb
//
//  Created by António Loureiro on 29/12/2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()

        return true
    }
}


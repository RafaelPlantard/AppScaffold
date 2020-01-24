//
//  AppDelegate.swift
//  AppScaffold
//
//  Created by Rafael Ferreira on 12/15/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

import Core
import UIKit

final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    // MARK: Private variables

    private var app: Coordinator?

    // MARK: UIApplicationDelegate conforms

    func applicationDidFinishLaunching(_ application: UIApplication) {
        let navigationController = UINavigationController()
        let newWindow = UIWindow()
        let appCoordinator = AppCoordinator(navigationController: navigationController, window: newWindow)
        appCoordinator.start()

        app = appCoordinator
        window = newWindow
    }
}

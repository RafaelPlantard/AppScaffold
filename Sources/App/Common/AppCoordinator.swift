//
//  AppCoordinator.swift
//  AppScaffold
//
//  Created by Rafael Ferreira on 12/15/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

import Core
import Feature
import UIKit

final class AppCoordinator: Coordinator, FeatureCoordinatorDelegate {
    private let navigationController: UINavigationController
    private let window: UIWindow

    // MARK: Private variables

    private var childCoordinators: [Coordinator] = []

    // MARK: Initializer

    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }

    // MARK: Coordinator conforms

    func start() {
        setupWindow()
        showFeature()
    }

    // MARK: FeatureCoordinatorDelegate conforms

    func featureCoordinatorDidFinish(_ coordinator: FeatureCoordinator) {
        // TODO: Redirect to the next feature
    }

    func finish(_ coordinator: Coordinator) {
        childCoordinators.removeFirst(where: { item in item === coordinator })
        navigationController.delegate = childCoordinators.last as? UINavigationControllerDelegate
    }

    // MARK: Private functions

    private func setupWindow() {
        window.backgroundColor = .white
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    private func showFeature() {
        let featureCoordinator = FeatureCoordinator(navigationController: navigationController)
        featureCoordinator.delegate = self
        childCoordinators.append(featureCoordinator)
        featureCoordinator.start()
    }
}

//
//  FeatureCoordinator.swift
//  Feature
//
//  Created by Rafael Ferreira on 12/31/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

import Core
import UIKit

public final class FeatureCoordinator: Coordinator, ListFeatureViewControllerDelegate {
    private let navigationController: UINavigationController

    // MARK: Variables

    public weak var delegate: FeatureCoordinatorDelegate?

    // MARK: Initializer

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: Coordinator conforms

    public func start() {
        let presenter = ListFeaturePresenter()
        let interactor = ListFeatureInteractor(store: YearsMemoryStore(), presenter: presenter)
        let listYearViewController = ListFeatureViewController(interactor: interactor)
        listYearViewController.delegate = self
        presenter.viewController = listYearViewController

        navigationController.setViewControllers([listYearViewController], animated: true)
    }

    // MARK: ListFeatureViewControllerDelegate conforms

    func listYearRightBarButtonItemTapped(_ viewController: ListFeatureViewController) {
        delegate?.featureCoordinatorDidFinish(self)
    }
}

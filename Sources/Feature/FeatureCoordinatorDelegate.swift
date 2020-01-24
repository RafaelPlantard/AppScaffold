//
//  FeatureCoordinatorDelegate.swift
//  Feature
//
//  Created by Rafael Ferreira on 1/3/20.
//  Copyright © 2020 Swift Yah. All rights reserved.
//

import Core

public protocol FeatureCoordinatorDelegate: CoordinatorDelegate {
    func featureCoordinatorDidFinish(_ coordinator: FeatureCoordinator)
}

//
//  FeaturesStoreProtocol.swift
//  Feature
//
//  Created by Rafael Ferreira on 12/31/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

protocol FeaturesStoreProtocol {
    func fetchFeatures(then handler: (Result<[Feature], Error>) -> Void)
}

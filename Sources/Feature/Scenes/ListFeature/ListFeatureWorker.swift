//
//  ListFeatureWorker.swift
//  Feature
//
//  Created by Rafael Ferreira on 12/31/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

final class ListFeatureWorker {
    private let store: FeaturesStoreProtocol

    // MARK: Initializers

    init(store: FeaturesStoreProtocol) {
        self.store = store
    }

    // MARK: Functions

    func fetchYears(then handler: (Result<[Feature], Error>) -> Void) {
        store.fetchFeatures(then: handler)
    }
}

//
//  ListFeatureInteractor.swift
//  Feature
//
//  Created by Rafael Ferreira on 12/31/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

protocol ListFeatureBusinessLogic {
    func fetchYears()
}

final class ListFeatureInteractor: ListFeatureBusinessLogic {
    private let worker: ListFeatureWorker
    private let presenter: ListFeaturePresentationLogic

    // MARK: Initializer

    init(store: FeaturesStoreProtocol, presenter: ListFeaturePresentationLogic) {
        self.worker = ListFeatureWorker(store: store)
        self.presenter = presenter
    }

    // MARK: ListFeatureBusinessLogic conforms

    func fetchYears() {
        worker.fetchYears { [weak self] result in
            let features: [Feature]

            do {
                features = try result.get()
            } catch {
                features = []
            }

            let response = ListFeature.FetchYears.Response(features: features)

            self?.presenter.presentFetchedYears(response: response)
        }
    }
}

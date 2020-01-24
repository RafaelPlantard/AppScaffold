//
//  ListFeaturePresenter.swift
//  Feature
//
//  Created by Rafael Ferreira on 12/31/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

protocol ListFeaturePresentationLogic {
    func presentFetchedYears(response: ListFeature.FetchYears.Response)
}

final class ListFeaturePresenter: ListFeaturePresentationLogic {
    weak var viewController: ListYearDisplayLogic?

    // MARK: ListFeaturePresentationLogic conforms

    func presentFetchedYears(response: ListFeature.FetchYears.Response) {
        let viewModel = ListFeature.FetchYears.ViewModel()

        viewController?.displayFetchedYears(viewModel: viewModel)
    }
}

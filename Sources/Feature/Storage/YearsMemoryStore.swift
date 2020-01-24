//
//  YearsMemoryStore.swift
//  Feature
//
//  Created by Rafael Ferreira on 12/31/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

final class YearsMemoryStore: FeaturesStoreProtocol {
    func fetchFeatures(then handler: (Result<[Feature], Error>) -> Void) {
        handler(.success([]))
    }
}

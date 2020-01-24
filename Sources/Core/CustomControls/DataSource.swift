//
//  DataSource.swift
//  Core
//
//  Created by Rafael Ferreira on 12/30/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

public class DataSource<Model>: NSObject {
    private var models: [Model]

    // MARK: Initializers

    init(models: [Model]) {
        self.models = models
        super.init()
    }

    // MARK: Computed variables

    var count: Int {
        return models.count
    }

    // MARK: Functions

    public func get(at index: Int) -> Model {
        return models[index]
    }

    public func set(models: [Model]) {
        self.models = models
    }

    public func append(models modelsToAppend: Model...) {
        models.append(contentsOf: modelsToAppend)
    }
}

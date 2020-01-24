//
//  CollectionViewDataSource.swift
//  Core
//
//  Created by Rafael Ferreira on 12/26/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

import UIKit

public final class CollectionViewDataSource<Model, Cell>: DataSource<Model>, UICollectionViewDataSource
    where Cell: UICollectionViewCell {
    public typealias CellConfigurator = (Model, Cell) -> Void

    // MARK: Private constants

    private let cellConfigurator: CellConfigurator

    // MARK: Initializers

    public init(models: [Model], cellConfigurator: @escaping CellConfigurator) {
        self.cellConfigurator = cellConfigurator
        super.init(models: models)
    }

    // MARK: UICollectionViewDataSource conforms

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = get(at: indexPath.row)
        let genericCell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.className, for: indexPath)

        guard let cell = genericCell as? Cell else {
            return genericCell
        }

        cellConfigurator(model, cell)

        return cell
    }
}

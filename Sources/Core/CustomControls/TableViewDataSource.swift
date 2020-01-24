//
//  TableViewDataSource.swift
//  Core
//
//  Created by Rafael Ferreira on 12/26/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

import UIKit

public final class TableViewDataSource<Model, Cell>: DataSource<Model>, UITableViewDataSource
    where Cell: UITableViewCell {
    public typealias CellConfigurator = (Model, Cell) -> Void

    // MARK: Private constants

    private let cellConfigurator: CellConfigurator

    // MARK: Initializers

    public init(models: [Model], cellConfigurator: @escaping CellConfigurator) {
        self.cellConfigurator = cellConfigurator
        super.init(models: models)
    }

    // MARK: UITableViewDataSource conforms

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = get(at: indexPath.row)
        let genericCell = tableView.dequeueReusableCell(withIdentifier: Cell.className, for: indexPath)

        guard let cell = genericCell as? Cell else {
            return genericCell
        }

        cellConfigurator(model, cell)

        return cell
    }
}

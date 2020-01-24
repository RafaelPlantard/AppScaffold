//
//  TableViewDelegate.swift
//  Core
//
//  Created by Rafael Ferreira on 1/5/20.
//  Copyright © 2020 Swift Yah. All rights reserved.
//

import UIKit

public final class TableViewDelegate: NSObject, UITableViewDelegate {
    private let action: (IndexPath) -> Void

    // MARK: Initializer

    public init(action: @escaping (IndexPath) -> Void) {
        self.action = action
        super.init()
    }

    // MARK: UITableViewDelegate conforms

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        action(indexPath)
    }
}

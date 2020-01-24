//
//  UITableView+ReuseIdentifier.swift
//  Core
//
//  Created by Rafael Ferreira on 1/5/20.
//  Copyright © 2020 Swift Yah. All rights reserved.
//

import UIKit

public extension UITableView {
    func register<T: UITableViewCell>(_ type: T.Type) {
        register(type, forCellReuseIdentifier: type.className)
    }
}

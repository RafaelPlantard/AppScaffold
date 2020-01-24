//
//  Value1TableViewCell.swift
//  Core
//
//  Created by Rafael Ferreira on 12/28/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

import UIKit

public final class Value1TableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

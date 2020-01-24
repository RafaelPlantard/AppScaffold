//
//  TitleCollectionReusableView.swift
//  Core
//
//  Created by Rafael Ferreira on 1/2/20.
//  Copyright © 2020 Swift Yah. All rights reserved.
//

import UIKit

public final class TitleCollectionReusableView: UICollectionReusableView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)

        return label
    }()

    // MARK: Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupLayout()
    }

    // MARK: Functions

    public func set(title: String) {
        titleLabel.text = title
    }

    // MARK: Private functions

    private func setupLayout() {
        addSubview(titleLabel, constraints: [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

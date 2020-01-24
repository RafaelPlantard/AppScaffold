//
//  TitleCollectionViewCell.swift
//  Feature
//
//  Created by Rafael Ferreira on 12/31/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

import Core
import UIKit

public final class TitleCollectionViewCell: UICollectionViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.numberOfLines = 2

        return label
    }()

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupLayout()
        setupView()
    }

    // MARK: Override variables

    override public var isHighlighted: Bool {
        didSet { transition(isHighlighted: isHighlighted) }
    }

    // MARK: Functions

    func set(title: String) {
        titleLabel.text = title
    }

    // MARK: Private functions

    private func setupLayout() {
        addSubview(titleLabel, constraints: [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    private func transition(isHighlighted: Bool) {
        let duration = isHighlighted ? 0.45 : 0.4
        let transform = isHighlighted ? CGAffineTransform(scaleX: 0.96, y: 0.96) : CGAffineTransform.identity
        let bgColor = isHighlighted ? UIColor(white: 1, alpha: 0.45) : UIColor.white
        let animations = {
            self.transform = transform
            self.backgroundColor = bgColor
        }

        UIView.animate(
            withDuration: duration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0,
            options: [.allowUserInteraction, .beginFromCurrentState], animations: animations, completion: nil
        )
    }

    private func setupView() {
        layer.cornerRadius = 20
        backgroundColor = .white
    }
}

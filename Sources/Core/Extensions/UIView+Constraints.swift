//
//  UIView+Constraints.swift
//  carrefour
//
//  Created by Rafael Ferreira on 3/26/18.
//  Copyright © 2018 Carrefour Comercio e Industria Ltda. All rights reserved.
//

import UIKit

extension UIView {
    public func addSubview<T: UIView>(_ view: T, affectedViews: [T] = [], constraints: [NSLayoutConstraint]) {
        addSubview(view, affectedViews: affectedViews)

        NSLayoutConstraint.activate(constraints)
    }

    func addSubview<T: UIView>(_ view: T, affectedViews: [T] = [], _ viewBuilder: (T) -> Void) {
        addSubview(view, affectedViews: affectedViews)

        viewBuilder(view)
    }

    public func addSubview<T: UIView>(equalConstraintsFor view: T, affectedViews: [T] = []) {
        addSubview(view, affectedViews: affectedViews, constraints: [
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func addSubview<T: UIView>(_ view: T, autoresizingMask: UIView.AutoresizingMask) {
        addSubview(view)

        view.autoresizingMask = autoresizingMask
    }

    @discardableResult
    public func anchored() -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        return self
    }

    // MARK: Private functions

    private func addSubview<T: UIView>(_ view: T, affectedViews: [T]) {
        addSubview(view)

        [affectedViews + [view]].flatMap(Set.init).forEach { view in
            view.anchored()
        }
    }
}

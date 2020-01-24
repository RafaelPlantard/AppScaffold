//
//  NSLayoutConstraint+SafeArea.swift
//  BikeToWork
//
//  Created by Rafael Ferreira on 10/2/18.
//  Copyright © 2018 Swift Yah. All rights reserved.
//

import UIKit.NSLayoutConstraint

extension NSLayoutConstraint {
    func safe(constant: CGFloat) -> NSLayoutConstraint {
        if UIApplication.shared.safeAreaInsets.bottom > 0 {
            self.constant = constant
        }

        return self
    }
}

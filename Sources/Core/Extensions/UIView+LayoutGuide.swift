//
//  UIView+LayoutGuide.swift
//  BikeToWork
//
//  Created by Rafael Ferreira on 10/1/18.
//  Copyright © 2018 Swift Yah. All rights reserved.
//

import class UIKit.UIView

extension UIView: LayoutGuide {
}

extension UIView {
    var autoSafeAreaLayoutGuide: LayoutGuide {
        guard #available(iOS 11, *) else {
            return self
        }

        return safeAreaLayoutGuide
    }
}

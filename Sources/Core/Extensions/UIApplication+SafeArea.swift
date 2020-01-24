//
//  UIApplication+SafeArea.swift
//  BikeToWork
//
//  Created by Rafael Ferreira on 10/2/18.
//  Copyright © 2018 Swift Yah. All rights reserved.
//

import class UIKit.UIApplication
import struct UIKit.UIEdgeInsets

extension UIApplication {
    var safeAreaInsets: UIEdgeInsets {
        guard #available(iOS 11, *), let window = windows.first(where: { window in window.isKeyWindow }) else {
            return .zero
        }

        return window.safeAreaInsets
    }
}

//
//  NSObjectProtocol+ClassName.swift
//  Core
//
//  Created by Rafael Ferreira on 12/26/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

public extension NSObjectProtocol {
    static var className: String {
        return String(describing: Self.self)
    }
}

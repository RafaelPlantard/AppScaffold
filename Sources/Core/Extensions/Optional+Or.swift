//
//  Optional+Or.swift
//  Core
//
//  Created by Rafael Ferreira on 12/24/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

public extension Optional {
    func or(_ value: Wrapped) -> Wrapped {
        switch self {
        case .none: return value
        case let .some(wrapped): return wrapped
        }
    }
}

//
//  Array.swift
//  Core
//
//  Created by Rafael Ferreira on 1/9/20.
//  Copyright © 2020 Swift Yah. All rights reserved.
//

public extension Array {
    mutating func removeFirst(where shouldBeRemoved: (Element) throws -> Bool) rethrows {
        if let index = try? firstIndex(where: shouldBeRemoved) {
            remove(at: index)
        }
    }
}

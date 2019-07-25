//
//  Array+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/9/12.
//

import Foundation

extension Array where Element: Equatable {
    public mutating func remove(e: Element) {
        guard contains(e) else { return }

        let index = self.index(of: e)!
        remove(at: index)
    }

    public func next(for current: Element) -> Element? {
        guard
            let index = self.index(of: current),
            self.count > index + 1
        else { return nil }

        return self[index + 1]
    }

    public func previous(for current: Element) -> Element? {
        guard
            let index = self.index(of: current),
            index - 1 >= 0
        else { return nil }

        return self[index - 1]
    }

    public func next(for current: Element?) -> Element? {
        guard let current = current else { return nil }
        return next(for: current)
    }

    public func previous(for current: Element?) -> Element? {
        guard let current = current else { return nil }
        return previous(for: current)
    }
}

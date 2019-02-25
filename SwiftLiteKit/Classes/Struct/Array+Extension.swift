//
//  Array+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/9/12.
//

import Foundation

extension Array where Element: Equatable {
    public mutating func remove(e: Element) {
        guard self.contains(e) else { return }

        let index = self.index(of: e)!
        self.remove(at: index)
    }
}

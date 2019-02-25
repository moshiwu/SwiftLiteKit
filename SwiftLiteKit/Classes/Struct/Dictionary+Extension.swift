//
//  Dictionary+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2018/4/10.
//

import Foundation

extension Dictionary {
    /// convenience method for Dictionary.merge
    public mutating func mergeCurrent(_ other: [Dictionary.Key: Dictionary.Value]) {
        self.merge(other) { current, _ in current }
    }

    /// convenience method for Dictionary.merge
    public mutating func mergeNew(_ other: [Dictionary.Key: Dictionary.Value]) {
        self.merge(other) { _, new in new }
    }

    /// convenience method for Dictionary.merging
    public func mergingCurrent(_ other: [Dictionary.Key: Dictionary.Value]) -> [Dictionary.Key: Dictionary.Value] {
        return self.merging(other) { current, _ in current }
    }

    /// convenience method for Dictionary.merging
    public func mergingNew(_ other: [Dictionary.Key: Dictionary.Value]) -> [Dictionary.Key: Dictionary.Value] {
        return self.merging(other) { _, new in new }
    }
}

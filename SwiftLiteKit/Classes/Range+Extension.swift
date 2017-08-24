//
//  Range+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/8/24.
//

import Foundation

extension Range where Bound == Int {
    public func toNSRange() -> NSRange {
        return NSMakeRange(self.lowerBound, self.upperBound - self.lowerBound)
    }
}

extension CountableRange where Bound == Int {
    public func toNSRange() -> NSRange {
        return NSMakeRange(self.lowerBound, self.upperBound - self.lowerBound)
    }
}

extension CountableClosedRange where Bound == Int {
    public func toNSRange() -> NSRange {
        return NSMakeRange(self.lowerBound, self.upperBound + 1 - self.lowerBound)
    }
}

extension ClosedRange where Bound == Int {
    public func toNSRange() -> NSRange {
        return NSMakeRange(self.lowerBound, self.upperBound + 1 - self.lowerBound)
    }
}

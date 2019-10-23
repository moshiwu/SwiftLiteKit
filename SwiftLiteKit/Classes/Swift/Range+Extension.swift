//
//  Range+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/8/24.
//

import Foundation

extension Range where Bound == Int {
    public func toNSRange() -> NSRange {
        return NSMakeRange(lowerBound, upperBound - lowerBound)
    }
}

extension ClosedRange where Bound == Int {
    public func toNSRange() -> NSRange {
        return NSMakeRange(lowerBound, upperBound + 1 - lowerBound)
    }
}

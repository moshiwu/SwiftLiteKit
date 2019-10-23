//
//  NSDecimalNumber+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2018/5/3.
//

public func < (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return left.compare(right) == ComparisonResult.orderedAscending
}

public func > (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return left.compare(right) == ComparisonResult.orderedDescending
}

public func <= (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return left.compare(right) != ComparisonResult.orderedDescending
}

public func >= (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return left.compare(right) != ComparisonResult.orderedAscending
}

public func + (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.adding(right)
}

public func - (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.subtracting(right)
}

public func * (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.multiplying(by: right)
}

public func / (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.dividing(by: right)
}

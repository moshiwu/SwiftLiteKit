//
//  CGFloatConvertible.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/21.
//

public protocol CGFloatConvertible {
    var cgFloat: CGFloat { get }
}

public extension CGFloatConvertible where Self: BinaryInteger {
    var cgFloat: CGFloat { return CGFloat(self) }
}

public extension CGFloatConvertible where Self: BinaryFloatingPoint {
    var cgFloat: CGFloat { return CGFloat(self) }
}

extension Int: CGFloatConvertible {}
extension Int8: CGFloatConvertible {}
extension Int16: CGFloatConvertible {}
extension Int32: CGFloatConvertible {}
extension Int64: CGFloatConvertible {}
extension Float: CGFloatConvertible {}
//extension Float80: CGFloatConvertible {}
extension Double: CGFloatConvertible {}
extension CGFloat: CGFloatConvertible {}

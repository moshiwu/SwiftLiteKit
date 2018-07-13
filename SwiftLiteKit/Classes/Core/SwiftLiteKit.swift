//
//  SwiftLiteKit.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2018/4/16.
//

import UIKit

/// 避免冲突用
public struct SwiftLiteKit<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol SwiftLiteKitCompatible {
    associatedtype CompatibleType
    var slk: SwiftLiteKit<CompatibleType> { get }
}

public extension SwiftLiteKitCompatible {
    public var slk: SwiftLiteKit<Self> { return SwiftLiteKit(self) }
}

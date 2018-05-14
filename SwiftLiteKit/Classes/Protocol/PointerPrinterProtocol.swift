//
//  PointerPrinterProtocol.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/9/4.
//

// just use for debug.
// available with instance of (Objective-C Class / Swift Class / struct / enum)
//
// example:
//      class A {}
//      extension A: PointerPrinter {}
//      print(a1.pointer)
public protocol PointerPrinter {
    var pointer: String { get }
}

extension PointerPrinter {
    // default implementation
    public var pointer: String {
        return Unmanaged<AnyObject>.passUnretained(self as AnyObject).toOpaque().debugDescription
    }
}

extension SwiftLiteKit: PointerPrinter {
    // change implementation
    public var pointer: String {
        return Unmanaged<AnyObject>.passUnretained(self.base as AnyObject).toOpaque().debugDescription
    }
}

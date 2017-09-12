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
protocol PointerPrinter {
    var pointer: String { get }
}

extension PointerPrinter {
    public var pointer: String {
        return Unmanaged<AnyObject>.passUnretained(self as AnyObject).toOpaque().debugDescription
    }
}

extension NSObject: PointerPrinter {

}

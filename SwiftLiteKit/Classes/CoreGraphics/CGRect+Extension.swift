//
//  CGRect+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/21.
//

import UIKit

public extension CGRect {
    init(_ x: CGFloatConvertible, _ y: CGFloatConvertible, _ width: CGFloatConvertible, _ height: CGFloatConvertible) {
        self.init(x: x.cgFloat, y: y.cgFloat, width: width.cgFloat, height: height.cgFloat)
    }
}

public extension CGRect {
    /// Android Rect -> iOS Rect
    init(left: CGFloatConvertible, top: CGFloatConvertible, right: CGFloatConvertible, bottom: CGFloatConvertible) {
        self.init(origin: CGPoint(x: left, y: top), size: CGSize(width: right.cgFloat - left.cgFloat, height: bottom.cgFloat - top.cgFloat))
    }
}

public extension CGRect {
    func apply(origin newValue: CGPoint) -> CGRect {
        return CGRect(origin.x + newValue.x, origin.y + newValue.y, width, height)
    }

    func apply(size newValue: CGSize) -> CGRect {
        return CGRect(origin.x, origin.y, width + newValue.width, height + newValue.height)
    }

    func apply(x newValue: CGFloat) -> CGRect {
        return CGRect(origin.x + newValue, origin.y, width, height)
    }

    func apply(y newValue: CGFloat) -> CGRect {
        return CGRect(origin.x, origin.y + newValue, width, height)
    }

    func apply(weight newValue: CGFloat) -> CGRect {
        return CGRect(origin.x, origin.y, width + newValue, height)
    }

    func apply(height newValue: CGFloat) -> CGRect {
        return CGRect(origin.x, origin.y, width, height + newValue)
    }

    func mult(all value: CGFloat) -> CGRect {
        return CGRect(origin.x * value, origin.y * value, width * value, height * value)
    }
}

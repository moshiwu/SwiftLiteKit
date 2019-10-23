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

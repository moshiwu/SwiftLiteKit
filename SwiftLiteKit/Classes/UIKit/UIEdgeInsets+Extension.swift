//
//  UIEdgeInsets+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/21.
//

import UIKit

public extension UIEdgeInsets {
    init(all value: CGFloatConvertible) {
        self.init(top: value.cgFloat, left: value.cgFloat, bottom: value.cgFloat, right: value.cgFloat)
    }

    init(_ top: CGFloatConvertible, _ left: CGFloatConvertible, _ bottom: CGFloatConvertible, _ right: CGFloatConvertible) {
        self.init(top: top.cgFloat, left: left.cgFloat, bottom: bottom.cgFloat, right: right.cgFloat)
    }
}

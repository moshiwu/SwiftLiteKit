//
//  FloatingPoint+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/11/7.
//

extension FloatingPoint {
    /// 角度转弧度
    public var radianValue: Self {
        return self * .pi / 180
    }

    /// 弧度转角度
    public var angleValue: Self {
        return self * 180 / .pi
    }
}

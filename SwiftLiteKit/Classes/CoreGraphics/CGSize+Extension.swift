//
//  CGSize+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2018/4/17.
//

import UIKit

public extension CGSize {
    init(width: CGFloatConvertible, height: CGFloatConvertible) {
        self.init(width: width.cgFloat, height: height.cgFloat)
    }

    init(_ width: CGFloatConvertible, _ height: CGFloatConvertible) {
        self.init(width: width.cgFloat, height: height.cgFloat)
    }

    init(both value: CGFloatConvertible) {
        self.init(width: value.cgFloat, height: value.cgFloat)
    }
}

extension CGSize {
    /// 宽度除以给定数，高度不变
    func divideWidth(by value: CGFloat) -> CGSize {
        return CGSize(width: width / value, height: height)
    }

    // 宽度乘以给定数，高度不变
    public func multiplyWidth(by value: CGFloat) -> CGSize {
        return CGSize(width: width * value, height: height)
    }

    /// 高度除以给定数，宽度不变
    public func divideHeight(by value: CGFloat) -> CGSize {
        return CGSize(width: width, height: height / value)
    }

    /// 高度乘以给定数，宽度不变
    public func multiplyHeight(by value: CGFloat) -> CGSize {
        return CGSize(width: width, height: height * value)
    }

    /// 宽高同时除以给定数值
    public func divideSize(by value: CGFloat) -> CGSize {
        return CGSize(width: width / value, height: height / value)
    }

    /// 宽高同时乘以给定数值
    public func multiplySize(by value: CGFloat) -> CGSize {
        return CGSize(width: width * value, height: height * value)
    }

    /// 给定宽度，保持宽高比
    public func setWidthAndKeepRatio(with value: CGFloat) -> CGSize {
        return CGSize(width: value, height: value / (width / height))
    }

    /// 给定高度，保持宽高比
    public func setHeightAndKeepRaito(with value: CGFloat) -> CGSize {
        return CGSize(width: value * (width / height), height: value)
    }
}

public func + (l: CGSize, r: CGSize) -> CGSize {
    return CGSize(width: l.width + r.width, height: l.height + r.height)
}

public func - (l: CGSize, r: CGSize) -> CGSize {
    return CGSize(width: l.width - r.width, height: l.height - r.height)
}

public func * (l: CGSize, r: CGSize) -> CGSize {
    return CGSize(width: l.width * r.width, height: l.height * r.height)
}

public func / (l: CGSize, r: CGSize) -> CGSize {
    return CGSize(width: l.width / r.width, height: l.height / r.height)
}

public func + (l: CGSize, value: CGFloat) -> CGSize {
    return CGSize(width: l.width + value, height: l.height + value)
}

public func - (l: CGSize, value: CGFloat) -> CGSize {
    return CGSize(width: l.width - value, height: l.height - value)
}

public func * (l: CGSize, value: CGFloat) -> CGSize {
    return CGSize(width: l.width * value, height: l.height * value)
}

public func / (l: CGSize, value: CGFloat) -> CGSize {
    return CGSize(width: l.width / value, height: l.height / value)
}

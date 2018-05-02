//
//  CGPoint+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/9/1.
//

import UIKit

public func +(l: CGPoint, r: CGPoint) -> CGPoint {
    return CGPoint(x: l.x + r.x, y: l.y + r.y)
}

public func -(l: CGPoint, r: CGPoint) -> CGPoint {
    return CGPoint(x: l.x - r.x, y: l.y - r.y)
}

public func *(l: CGPoint, r: CGPoint) -> CGPoint {
    return CGPoint(x: l.x * r.x, y: l.y * r.y)
}

public func /(l: CGPoint, r: CGPoint) -> CGPoint {
    return CGPoint(x: l.x / r.x, y: l.y / r.y)
}

public func +(l: CGPoint, value: CGFloat) -> CGPoint {
    return CGPoint(x: l.x + value, y: l.y + value)
}

public func -(l: CGPoint, value: CGFloat) -> CGPoint {
    return CGPoint(x: l.x - value, y: l.y - value)
}

public func *(l: CGPoint, value: CGFloat) -> CGPoint {
    return CGPoint(x: l.x * value, y: l.y * value)
}

public func /(l: CGPoint, value: CGFloat) -> CGPoint {
    return CGPoint(x: l.x / value, y: l.y / value)
}

//
//  CGPoint+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/9/1.
//

import UIKit

extension CGPoint {
    public static func *(l: CGPoint, r: CGPoint) -> CGPoint {
        return CGPoint(x: l.x * r.x, y: l.y * r.y)
    }
    
    public static func /(l: CGPoint, r: CGPoint) -> CGPoint {
        return CGPoint(x: l.x / r.x, y: l.y / r.y)
    }
    
    public static func +(l: CGPoint, r: CGPoint) -> CGPoint {
        return CGPoint(x: l.x + r.x, y: l.y + r.y)
    }
    
    public static func -(l: CGPoint, r: CGPoint) -> CGPoint {
        return CGPoint(x: l.x - r.x, y: l.y - r.y)
    }
}
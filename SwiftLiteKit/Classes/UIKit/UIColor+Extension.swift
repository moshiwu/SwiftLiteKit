//
//  UIColor+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/5/29.
//

import UIKit

public extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: CGFloat = 1) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }

    static func rgb(_ value: UInt32) -> UIColor {
        return UIColor(red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
                       green: CGFloat((value & 0xFF00) >> 8) / 255.0,
                       blue: CGFloat(value & 0xFF) / 255.0,
                       alpha: 1)
    }

    static func rgba(_ value: UInt32) -> UIColor {
        return UIColor(red: CGFloat((value & 0xFF00_0000) >> 24) / 255.0,
                       green: CGFloat((value & 0xFF0000) >> 16) / 255.0,
                       blue: CGFloat((value & 0xFF00) >> 8) / 255.0,
                       alpha: CGFloat(value & 0xFF) / 255.0)
    }

    static var randomColor: UIColor {
        let red = CGFloat(arc4random() % 256) / 255.0
        let green = CGFloat(arc4random() % 256) / 255.0
        let blue = CGFloat(arc4random() % 256) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

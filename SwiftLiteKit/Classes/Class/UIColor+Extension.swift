//
//  UIColor+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/5/29.
//

import UIKit

extension UIColor {
    public static func rgb(_ value: UInt32) -> UIColor {
        return UIColor(red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
                       green: CGFloat((value & 0xFF00) >> 8) / 255.0,
                       blue: CGFloat(value & 0xFF) / 255.0,
                       alpha: 1)
    }

    public static func rgba(_ value: UInt32) -> UIColor {
        return UIColor(red: CGFloat((value & 0xFF00_0000) >> 24) / 255.0,
                       green: CGFloat((value & 0xFF0000) >> 16) / 255.0,
                       blue: CGFloat((value & 0xFF00) >> 8) / 255.0,
                       alpha: CGFloat(value & 0xFF) / 255.0)
    }
}

//
//  UIView+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/9/1.
//

import Foundation

extension UIView
{
    public func addSubviews(_ views: [UIView])
    {
        views.forEach { self.addSubview($0) }
    }

    public func removeAllSubviews()
    {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
}

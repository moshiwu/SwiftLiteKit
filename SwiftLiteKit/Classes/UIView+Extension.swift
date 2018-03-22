//
//  UIView+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/9/1.
//

import UIKit

extension UIView
{
    public func addSubviews(_ views: [UIView])
    {
        views.forEach { self.addSubview($0) }
    }

    public func _removeAllSubviews()
    {
        self.subviews.forEach { $0.removeFromSuperview() }
    }

    public func printAllMySubview()
    {
        self.printView(view: self)
    }

    fileprivate func printView(view: UIView)
    {
        print("\(NSStringFromClass(view.classForCoder)) : \(view.frame)")
        view.subviews.forEach { printView(view: $0) }
    }
}

//
//  UIView+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/9/1.
//
import UIKit

// extension UIView: SwiftLiteKitCompatible {}

extension SwiftLiteKit where Base: UIView
{
    public func addSubviews(_ views: [UIView])
    {
        views.forEach { self.base.addSubview($0) }
    }

    public func _removeAllSubviews()
    {
        self.base.subviews.forEach { $0.removeFromSuperview() }
    }

    public func printAllMySubview()
    {
        self.printView(view: self.base)
    }

    fileprivate func printView(view: UIView)
    {
        print("\(NSStringFromClass(view.classForCoder)) : \(view.frame)")
        view.subviews.forEach { printView(view: $0) }
    }

    /// 设置圆角，注意这种设圆角的方法会导致离屏渲染，不要大量使用
    public func setCornerRadius(value: CGFloat, borderWidth: CGFloat, borderColor: UIColor, backgroundColor: UIColor? = nil)
    {
        self.base.layer.cornerRadius = value
        self.base.layer.borderWidth = borderWidth
        self.base.layer.borderColor = borderColor.cgColor
        self.base.clipsToBounds = true

        guard let color = backgroundColor else { return }
        self.base.backgroundColor = color
    }
}

extension UIView
{
    public var x: CGFloat
    {
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue }
    }

    public var y: CGFloat
    {
        get { return self.frame.origin.y }
        set { self.frame.origin.y = newValue }
    }

    public var width: CGFloat
    {
        get { return self.frame.size.width }
        set { self.frame.size.width = newValue }
    }

    public var height: CGFloat
    {
        get { return self.frame.size.height }
        set { self.frame.size.height = newValue }
    }

    public var centerX: CGFloat
    {
        get { return self.center.x }
        set { self.center.x = newValue }
    }

    public var centerY: CGFloat
    {
        get { return self.center.y }
        set { self.center.y = newValue }
    }

    public var size: CGSize
    {
        get { return self.frame.size }
        set { self.frame.size = newValue }
    }
}

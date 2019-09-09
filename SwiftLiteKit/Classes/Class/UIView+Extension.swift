//
//  UIView+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/9/1.
//
import UIKit

// extension UIView: SwiftLiteKitCompatible {}

// MARK: - View Display Index Control

extension SwiftLiteKit where Base: UIView {
    public func bringMeToFront() {
        base.superview?.bringSubviewToFront(base)
    }

    public func sendMeToBack() {
        base.superview?.sendSubviewToBack(base)
    }

    public func addSubviews(_ views: [UIView]) {
        views.forEach { self.base.addSubview($0) }
    }
}

// MARK: - Debug Methods

extension SwiftLiteKit where Base: UIView {
    public func _removeAllSubviews() {
        base.subviews.forEach { $0.removeFromSuperview() }
    }

    public func printAllMySubview() {
        printView(view: base)
    }

    fileprivate func printView(view: UIView) {
        print("\(NSStringFromClass(view.classForCoder)) : \(view.frame)")
        view.subviews.forEach { printView(view: $0) }
    }
}

// MARK: - Corner And Shadow

extension SwiftLiteKit where Base: UIView {
    /// 设置圆角，注意这种设圆角的方法如果设置clipsToBounds=true会导致离屏渲染，不要大量使用
    public func setCornerRadius(value: CGFloat, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, backgroundColor: UIColor? = nil, clipsToBounds: Bool = true) {
        base.layer.cornerRadius = value
        base.layer.borderWidth = borderWidth
        base.layer.borderColor = borderColor.cgColor
        base.clipsToBounds = clipsToBounds

        guard let color = backgroundColor else { return }
        base.backgroundColor = color
    }

    /// 创建一个阴影View，本方法主要用于避免离屏渲染，默认不开启格栅化
    ///   - rasterize: 格栅化，开启的话会使用缓存，旨在于降低性能损失，但至少会触发一次离屏渲染
    public func createShadowView(foregroundColor: UIColor, color: UIColor, offset: CGSize, radius: CGFloat, rasterize: Bool = false, cornerRadius: CGFloat = 0.0) {
        base.layoutIfNeeded()

        let tag = 3847273
        base.viewWithTag(tag)?.removeFromSuperview()

        let shadowView = UIView(frame: base.bounds)
        shadowView.isUserInteractionEnabled = false
        shadowView.tag = tag
        shadowView.backgroundColor = foregroundColor // shadowView的背景就是整个阴影效果的前景
        shadowView.layer.shadowColor = color.cgColor
        shadowView.layer.shadowOffset = offset
        shadowView.layer.shadowRadius = radius
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.cornerRadius = cornerRadius
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: base.bounds, cornerRadius: cornerRadius).cgPath
        shadowView.layer.shouldRasterize = rasterize
        shadowView.layer.rasterizationScale = UIScreen.main.scale

        base.insertSubview(shadowView, at: 0)
    }
}

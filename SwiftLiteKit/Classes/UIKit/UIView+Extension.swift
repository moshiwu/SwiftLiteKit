//
//  UIView+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/9/1.
//

import UIKit

public extension UIView.AutoresizingMask {
    static let all: UIView.AutoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
}

// MARK: - Init

public extension UIView {
    convenience init(backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }

    convenience init(hexString: String) {
        self.init(backgroundColor: UIColor(hexString: hexString)!)
    }
}

// MARK: - DEBUG Method

public extension UIView {
    func randomAllSubviews() {
        #if DEBUG
            backgroundColor = .randomColor
            subviews.forEach { $0.randomAllSubviews() }
        #endif
    }

    func printAllMySubview() {
        printView(view: self)
    }

    fileprivate func printView(view: UIView) {
        print("\(NSStringFromClass(view.classForCoder)) : \(view.frame)")
        view.subviews.forEach { printView(view: $0) }
    }
}

// MARK: - View Add and DisplayIndex Control

public extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }

    func bringMeToFront() {
        superview?.bringSubviewToFront(self)
    }

    func sendMeToBack() {
        superview?.sendSubviewToBack(self)
    }
}

public extension UIView {
    func randomColor() {
        backgroundColor = .randomColor
    }
}

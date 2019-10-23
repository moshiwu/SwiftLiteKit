//
//  UIStackView+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/21.
//

import UIKit

public extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .horizontal,
                     distribution: UIStackView.Distribution = .fill,
                     alignment: UIStackView.Alignment = .fill,
                     spacing: CGFloat = 0.0) {
        self.init(frame: .zero)
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }

    func removeAllArrangedView() {
        arrangedSubviews.forEach { self.removeArrangedSubview($0) }
    }
}

//
//  UILabel+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/21.
//

import UIKit

public extension UILabel {
    convenience init(font: UIFont = .systemFont(ofSize: 17.0),
                     textAlignment: NSTextAlignment = .left,
                     numberOfLines: Int = 1,
                     lineBreakMode: NSLineBreakMode = .byWordWrapping,
                     textColor: UIColor = .black,
                     backgroundColor: UIColor? = .clear) {
        self.init(frame: .zero)
        self.font = font
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
}

public extension UILabel {
    /// 以分割标记为界，填充label颜色
    ///
    /// - Parameters:
    ///   - separator: 分割标记
    func fillTextColor(with separator: String, leftColor: UIColor = .black, rightColor: UIColor = UIColor(rgb: 0x888888), leftFont: UIFont? = nil, rightFont: UIFont? = nil) {
        guard let str = self.text else { return }
        let index = (str as NSString).range(of: separator).location

        if index != NSNotFound {
            let attributeText = NSMutableAttributedString(string: str)

            attributeText.setColor(leftColor, range: NSRange(location: 0, length: index + 1))
            attributeText.setColor(rightColor, range: NSRange(location: index + 1, length: str.count - index - 1))

            attributeText.font = font

            if leftFont != nil {
                attributeText.setFont(leftFont, range: NSRange(location: 0, length: index + 1))
            }

            if rightFont != nil {
                attributeText.setFont(rightFont, range: NSRange(location: index + 1, length: str.count - index - 1))
            }
            attributedText = attributeText
        }
    }
}

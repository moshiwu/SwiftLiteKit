//
//  UITextField+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/21.
//

import UIKit
import YYKit

private var _placeholderColor_key = "_placeholderColor_key"
private var _placeholderFont_key = "_placeholderFont_key"

public extension UITextField {
    convenience init(text: String? = nil,
                     font: UIFont = .systemFont(ofSize: 17.0),
                     textColor: UIColor = .black,
                     placeholder: String? = nil,
                     placeholderFont: UIFont = .systemFont(ofSize: 17.0),
                     placeholderColor: UIColor = .rgba(0x3C3C434D),
                     textAlignment: NSTextAlignment = .left,
                     backgroundColor: UIColor? = .clear) {
        self.init(frame: .zero)

        self.text = text
        self.font = font
        self.textColor = textColor

        self.placeholder = placeholder
        self.placeholderFont = placeholderFont
        self.placeholderColor = placeholderColor

        self.textAlignment = textAlignment

        self.backgroundColor = backgroundColor
    }

    var placeholderColor: UIColor? {
        set {
            let placeholderString = getPlaceholderAttribute()
            placeholderString.color = newValue
            attributedPlaceholder = placeholderString
            setAssociateValue(newValue, withKey: &_placeholderColor_key)
        }
        get {
            return getAssociatedValue(forKey: &_placeholderColor_key) as? UIColor
        }
    }

    var placeholderFont: UIFont? {
        set {
            let placeholderString = getPlaceholderAttribute()
            placeholderString.font = newValue
            attributedPlaceholder = placeholderString
            setAssociateValue(newValue, withKey: &_placeholderFont_key)
        }
        get {
            return getAssociatedValue(forKey: &_placeholderFont_key) as? UIFont
        }
    }

    private func getPlaceholderAttribute() -> NSMutableAttributedString {
        if let last = self.attributedPlaceholder {
            return NSMutableAttributedString(attributedString: last)
        } else {
            return NSMutableAttributedString(string: placeholder ?? "")
        }
    }
}

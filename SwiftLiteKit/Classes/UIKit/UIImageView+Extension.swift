//
//  UIImageView+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/21.
//

import UIKit

public extension UIImageView {
    convenience init(frame: CGRect = .zero, image: UIImage? = nil, highlightedImage: UIImage? = nil, contentMode: UIView.ContentMode = .scaleToFill) {
        self.init(image: image, highlightedImage: highlightedImage)
        self.frame = frame
        self.contentMode = contentMode
    }
}

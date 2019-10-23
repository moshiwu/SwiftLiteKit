//
//  UIButton+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/22.
//

import UIKit

public extension UIButton {
    convenience init(font: UIFont = .systemFont(ofSize: 17.0),
                     title: String? = nil,
                     titleColor: UIColor = .white,
                     image: UIImage? = nil,
                     backgroundImage: UIImage? = nil,
                     for state: UIControl.State = .normal) {
        self.init()

        titleLabel?.font = font
        setTitle(title, for: state)
        setTitleColor(titleColor, for: state)
        setImage(image, for: state)
        setBackgroundImage(backgroundImage, for: state)
    }

    func setImage(imageName: String?, for state: UIControl.State) {
        guard let imageName = imageName else {
            setImage(nil, for: .normal)
            return
        }
        setImage(UIImage(named: imageName), for: state)
    }

    func setBackgroundImage(imageName: String?, for state: UIControl.State) {
        guard let imageName = imageName else {
            setBackgroundImage(nil, for: .normal)
            return
        }
        setBackgroundImage(UIImage(named: imageName), for: state)
    }
}

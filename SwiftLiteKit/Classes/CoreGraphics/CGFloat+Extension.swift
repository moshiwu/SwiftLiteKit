//
//  CGFloat+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/22.
//

import UIKit

extension CGFloat {
    init?(_ value: String) {
        guard let number = CGFloat.NativeType(value) else { return nil }
        self.init(number)
    }
}

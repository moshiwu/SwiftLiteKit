//
//  UIApplication+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/5/15.
//

import UIKit

public extension UIApplication {
    func isAppStoreReceiptSandbox() -> Bool {
        let sign = Bundle.main.appStoreReceiptURL?.lastPathComponent
        return sign == "sandboxReceipt"
    }

    func hasEmbeddedMobileProvision() -> Bool {
        let value = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision")
        return value != nil
    }

    func isTestFlight() -> Bool {
        return isAppStoreReceiptSandbox() && !hasEmbeddedMobileProvision()
    }
}

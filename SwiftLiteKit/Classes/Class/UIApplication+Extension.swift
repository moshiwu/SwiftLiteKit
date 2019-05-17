//
//  UIApplication+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/5/15.
//

import UIKit

extension UIApplication {
    public func isAppStoreReceiptSandbox() -> Bool {
        let sign = Bundle.main.appStoreReceiptURL?.lastPathComponent
        return sign == "sandboxReceipt"
    }

    public func hasEmbeddedMobileProvision() -> Bool {
        let value = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision")
        return value != nil
    }

    public func isTestFlight() -> Bool {
        return isAppStoreReceiptSandbox() && !hasEmbeddedMobileProvision()
    }
}

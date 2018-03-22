//
//  DispatchQueue+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2018/3/13.
//

import Foundation

#if swift(>=3.2)

extension DispatchQueue {
    private static var _onceTracker = [String]()
    public class func once(token: String, block: () -> ()) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if self._onceTracker.contains(token) {
            return
        }
        self._onceTracker.append(token)
        block()
    }

    func async(block: @escaping () -> ()) {
        self.async(execute: block)
    }

    func after(time: DispatchTime, block: @escaping () -> ()) {
        self.asyncAfter(deadline: time, execute: block)
    }
}

#endif

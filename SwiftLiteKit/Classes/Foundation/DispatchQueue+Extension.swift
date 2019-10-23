//
//  DispatchQueue+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2018/3/13.
//

import Foundation

extension DispatchQueue {
    private static var _onceTracker = [String]()
    public class func once(token: String, block: () -> Void) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }

//    func async(block: @escaping () -> Void) {
//        async(execute: block)
//    }
//
//    func after(time: DispatchTime, block: @escaping () -> Void) {
//        asyncAfter(deadline: time, execute: block)
//    }
}

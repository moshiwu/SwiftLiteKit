//
//  Thread+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/8.
//

import Foundation

public extension Thread {
    static var allThreadName: [String] {
        var names: [String] = []

        var thread_list: thread_act_array_t? = UnsafeMutablePointer(mutating: [thread_act_t]())
        var thread_count: mach_msg_type_number_t = 0

        defer {
            if let thread_list = thread_list {
                vm_deallocate(mach_task_self_, vm_address_t(UnsafePointer(thread_list).pointee), vm_size_t(thread_count))
            }
        }

        task_threads(mach_task_self_, &thread_list, &thread_count)

        if let thread_list = thread_list {
            for i in 0 ..< Int(thread_count) {
                if let pt = pthread_from_mach_thread_np(thread_list[i]) {
                    var nameBytes: [Int8] = Array(repeating: 0, count: 256)
                    pthread_getname_np(pt, &nameBytes, nameBytes.count)
                    if let name = String(utf8String: nameBytes) {
                        names.append(name)
                    }
                }
            }
        }

        return names
    }
}

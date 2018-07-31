//
//  URL+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2018/7/27.
//

import Foundation

extension URL {
    /// 判断文件是否存在，同时判断是否包含"file://"
    public var fileExists: Bool {
        return FileManager.default.fileExists(atPath: self.isFileURL ? self.path : self.absoluteString)
    }
}

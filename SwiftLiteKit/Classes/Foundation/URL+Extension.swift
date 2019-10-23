//
//  URL+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2018/7/27.
//

import Foundation

public extension URL {
    /// 判断文件是否存在，同时判断是否包含"file://"
    var fileExists: Bool {
        return FileManager.default.fileExists(atPath: isFileURL ? path : absoluteString)
    }

    /// 文件夹内子文件列表
    var contentsOfDirectory: [URL] {
        let list = try? FileManager.default.contentsOfDirectory(at: self, includingPropertiesForKeys: nil, options: [])
        return list ?? []
    }

    /// 文件属性列表
    var fileAttributes: [FileAttributeKey: Any] {
        let dict = try? FileManager.default.attributesOfItem(atPath: path)
        return dict ?? [:]
    }

    /// 文件类型
    var fileType: FileAttributeType {
        return (fileAttributes[.type] as? FileAttributeType) ?? .typeUnknown
    }

    /// 文件大小
    var fileSize: UInt64 {
        return (fileAttributes[.size] as? UInt64) ?? 0
    }

    /// 文件创建日期
    var fileCreateDate: Date? {
        return fileAttributes[.creationDate] as? Date
    }

    /// 文件修改日期
    var fileModificationDate: Date? {
        return fileAttributes[.modificationDate] as? Date
    }
}

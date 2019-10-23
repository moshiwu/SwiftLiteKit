//
//  String+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/8/24.
//

import Foundation

// MARK: - 字符串截取

public extension String {
    @available(swift 3)
    func substring(to: Int) -> String {
        return (self as NSString).substring(with: NSMakeRange(0, to))
    }

    @available(swift 3)
    func substring(from: Int) -> String {
        return (self as NSString).substring(with: NSMakeRange(from, count - from))
    }

    @available(swift 3)
    func substring(with: NSRange) -> String {
        return (self as NSString).substring(with: with)
    }

    @available(swift 3)
    func substring(with: Range<Int>) -> String {
        return substring(with: with.toNSRange())
    }

    @available(swift 3)
    func substring(with: ClosedRange<Int>) -> String {
        return substring(with: with.toNSRange())
    }

    #if swift(>=4.0)
        @available(swift 4)
        func substring(with: CountablePartialRangeFrom<Int>) -> String {
            return substring(from: with.lowerBound)
        }

        @available(swift 4)
        func substring(with: PartialRangeUpTo<Int>) -> String {
            return substring(to: with.upperBound)
        }

        @available(swift 4)
        func substring(with: PartialRangeThrough<Int>) -> String {
            return substring(to: with.upperBound + 1)
        }
    #endif
}

// MARK: - Range下标

public extension String {
    // MARK: subscript for swift 3.2 range

    @available(swift 3)
    subscript(r: Range<Int>) -> String { return substring(with: r) }

    @available(swift 3)
    subscript(r: ClosedRange<Int>) -> String { return substring(with: r) }

    #if swift(>=4.0)

        // MARK: subscript for swift 4 range

        @available(swift 4)
        subscript(r: CountablePartialRangeFrom<Int>) -> String { return substring(with: r) }

        @available(swift 4)
        subscript(r: PartialRangeUpTo<Int>) -> String { return substring(with: r) }

        @available(swift 4)
        subscript(r: PartialRangeThrough<Int>) -> String { return substring(with: r) }
    #endif
}

// MARK: - 简便方法

public extension String {
    /// 国际化字符串
    var local: String { return NSLocalizedString(self, comment: self) }

    /// utf data
    var utfData: Data? {
        return data(using: .utf8)
    }

    /// html attribute string
    var htmlAttributedString: NSAttributedString? {
        guard let data = self.utfData else {
            return nil
        }
        do {
            return try NSAttributedString(data: data,
                                          options: [
                                              NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                                              NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue,
                                          ],
                                          documentAttributes: nil)
        } catch {
            return nil
        }
    }

    /// 移除第一个搜索到的字符串，不返回值
    mutating func remove(_ value: String) {
        guard let range = self.range(of: value) else { return }
        removeSubrange(range)
    }

    /// 移除第一个搜索到的字符串，返回结果
    func removed(_ value: String) -> String {
        guard let range = self.range(of: value) else { return self }
        var result = self
        result.removeSubrange(range)
        return result
    }

    /// 去掉所有空格
    func removeBlank() -> String {
        return replacingOccurrences(of: " ", with: "")
    }

    /// 去掉首尾空格和回车
    func trimmingBlank() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// url拼接
    func join(url: String? ...) -> String {
        return self + (hasSuffix("/") ? "" : "/") + url.compactMap { $0 }.joined(separator: "/")
    }

    var cgFloat: CGFloat? {
        return CGFloat(self)
    }
}

// MARK: - 文件属性操作

public extension String {
    /// 判断文件是否存在，同时判断是否包含"file://"
    var fileExists: Bool {
        let fileUrl = URL(fileURLWithPath: self)
        if fileUrl.isFileURL {
            return FileManager.default.fileExists(atPath: fileUrl.path)
        }
        return FileManager.default.fileExists(atPath: self)
    }

    /// 文件夹内子文件列表
    var contentsOfDirectory: [String] {
        let list = try? FileManager.default.contentsOfDirectory(atPath: self)
        return list ?? []
    }

    /// 文件属性列表
    var fileAttributes: [FileAttributeKey: Any] {
        let dict = try? FileManager.default.attributesOfItem(atPath: self)
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

// MARK: - 文件Url操作

public extension String {
    var pathComponents: [String] {
        return (self as NSString).pathComponents
    }

    var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }

    var pathExtension: String {
        return (self as NSString).pathExtension
    }

    func appendingPathComponent(_ pathComponent: String, isDirectory: Bool) -> String {
        return (self as NSString).appendingPathComponent(pathComponent) + (isDirectory ? "/" : "")
    }

    func appendingPathComponent(_ pathComponent: String) -> String {
        return (self as NSString).appendingPathComponent(pathComponent)
    }

    func deletingLastPathComponent() -> String {
        return (self as NSString).deletingLastPathComponent
    }

    func appendingPathExtension(_ pathExtension: String) -> String {
        return (self as NSString).appendingPathExtension(pathExtension) ?? self
    }

    func deletingPathExtension() -> String {
        return (self as NSString).deletingPathExtension
    }

    mutating func appendPathComponent(_ pathComponent: String, isDirectory: Bool) {
        self = (self as NSString).appendingPathComponent(pathComponent) + (isDirectory ? "/" : "")
    }

    mutating func appendPathComponent(_ pathComponent: String) {
        self = (self as NSString).appendingPathComponent(pathComponent)
    }

    mutating func appendPathExtension(_ pathExtension: String) {
        self = (self as NSString).appendingPathExtension(pathExtension) ?? self
    }

    mutating func deleteLastPathComponent() {
        self = (self as NSString).deletingLastPathComponent
    }

    mutating func deletePathExtension() {
        self = (self as NSString).deletingPathExtension
    }
}

// MARK: - 指针操作

public extension String {
    func charValue() -> UnsafePointer<Int8>? {
        return (self as NSString).utf8String
    }

    func mutableCharValue() -> UnsafeMutablePointer<Int8>? {
        let utf8Pointer = (self as NSString).utf8String
        let buffer = UnsafeMutablePointer<Int8>(mutating: utf8Pointer)
        return buffer
    }

    func unsafeMutableRawPointer() -> UnsafeMutableRawPointer? {
        let value = NSString(string: self)
        return Unmanaged<AnyObject>.passUnretained(value as AnyObject).toOpaque()
    }
}

// MARK: - 正则表达式验证

public extension String {
    func isValidate(with regex: String, options: NSRegularExpression.Options = []) -> Bool {
        guard let pattern = try? NSRegularExpression(pattern: regex, options: options) else { return false }
        return pattern.numberOfMatches(in: self, options: [], range: NSRange(location: 0, length: count)) > 0
    }

    /// 验证是否电话号码
    func isValidPhoneNumber() -> Bool {
        return isValidate(with: "^((13[0-9])|(147)|(15[^4,\\D])|(17[0-9])|(199)|(18[0,0-9]))\\d{8}$", options: [])
    }

    /// 数字
    func isValidNumber() -> Bool {
        return isValidate(with: "^[0-9]*$")
    }

    /// 数字，限制固定长度
    func isValidNumber(limit: Int) -> Bool {
        return isValidate(with: "^\\d{\(limit)}$")
    }

    /// 数字，限制最大长度
    func isValidNumber(max: Int) -> Bool {
        return isValidate(with: "^\\d{0,\(max)}$")
    }

    /// 字母+数字，限制固定长度
    func isValidLetterAndNumber(limit n: Int) -> Bool {
        return isValidate(with: "^[A-Za-z0-9]{\(n)}$", options: [])
    }

    /// 字母+数字，限制最大长度
    func isValidLetterAndNumber(max n: Int) -> Bool {
        return isValidate(with: "^[A-Za-z0-9]{0,\(n)}$", options: [])
    }

    /// 是否包含HTML标签，效果存疑
    func isValidHTML() -> Bool {
        return isValidate(with: "<(S*?)[^>]*>.*?|<.*? />")
    }

    /// 是否网址URL
    func isValidURL() -> Bool {
        return isValidate(with: "[a-zA-z]+://[^\\s]*")
    }
}

public extension NSString {
    /// 验证是否电话号码
    @objc func isValidPhoneNumber() -> Bool {
        return (self as String).isValidPhoneNumber()
    }

    /// 数字
    @objc func isValidNumber() -> Bool {
        return (self as String).isValidNumber()
    }

    /// 数字，限制固定长度
    @objc func isValidNumber(limit: Int) -> Bool {
        return (self as String).isValidNumber(limit: limit)
    }

    /// 数字，限制最大长度
    @objc func isValidNumber(max: Int) -> Bool {
        return (self as String).isValidNumber(max: max)
    }

    /// 字母+数字，限制固定长度
    @objc func isValidLetterAndNumber(limit n: Int) -> Bool {
        return (self as String).isValidLetterAndNumber(limit: n)
    }

    /// 字母+数字，限制最大长度
    @objc func isValidLetterAndNumber(max n: Int) -> Bool {
        return (self as String).isValidLetterAndNumber(max: n)
    }

    /// 是否包含HTML标签，效果存疑
    @objc func isValidHTML() -> Bool {
        return (self as String).isValidHTML()
    }
}

// MARK: - Other

public extension String {
    // 将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return encodeUrlString ?? ""
    }

    // 将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return removingPercentEncoding ?? ""
    }
}

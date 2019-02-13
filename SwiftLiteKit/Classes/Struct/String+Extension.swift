//
//  String+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/8/24.
//

import Foundation

// MARK: - 字符串截取

extension String {
    @available(swift 3)
    public func substring(to: Int) -> String {
        return (self as NSString).substring(with: NSMakeRange(0, to))
    }
    
    @available(swift 3)
    public func substring(from: Int) -> String {
        return (self as NSString).substring(with: NSMakeRange(from, self.count - from))
    }
    
    @available(swift 3)
    public func substring(with: NSRange) -> String {
        return (self as NSString).substring(with: with)
    }
    
    @available(swift 3)
    public func substring(with: Range<Int>) -> String {
        return self.substring(with: with.toNSRange())
    }
    
    @available(swift 3)
    public func substring(with: ClosedRange<Int>) -> String {
        return self.substring(with: with.toNSRange())
    }
    
    #if swift(>=4.0)
    @available(swift 4)
    public func substring(with: CountablePartialRangeFrom<Int>) -> String {
        return self.substring(from: with.lowerBound)
    }
    
    @available(swift 4)
    public func substring(with: PartialRangeUpTo<Int>) -> String {
        return self.substring(to: with.upperBound)
    }
    
    @available(swift 4)
    public func substring(with: PartialRangeThrough<Int>) -> String {
        return self.substring(to: with.upperBound + 1)
    }
    #endif
}

// MARK: - Range下标

extension String {

    // MARK: subscript for swift 3.2 range
    
    @available(swift 3)
    public subscript(r: Range<Int>) -> String { return self.substring(with: r) }
    
    @available(swift 3)
    public subscript(r: ClosedRange<Int>) -> String { return self.substring(with: r) }
    
    #if swift(>=4.0)
    
    // MARK: subscript for swift 4 range
    
    @available(swift 4)
    public subscript(r: CountablePartialRangeFrom<Int>) -> String { return self.substring(with: r) }
    
    @available(swift 4)
    public subscript(r: PartialRangeUpTo<Int>) -> String { return self.substring(with: r) }
    
    @available(swift 4)
    public subscript(r: PartialRangeThrough<Int>) -> String { return self.substring(with: r) }
    #endif
}

// MARK: - 简便方法

extension String {
    /// 国际化字符串
    public var local: String { return NSLocalizedString(self, comment: self) }
    
    /// utf data
    public var utfData: Data? {
        return self.data(using: .utf8)
    }
    
    /// html attribute string
    public var htmlAttributedString: NSAttributedString? {
        guard let data = self.utfData else {
            return nil
        }
        do {
            return try NSAttributedString(data: data,
                                          options: [
                                              NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                                              NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
                                          ],
                                          documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    /// 移除第一个搜索到的字符串，不返回值
    public mutating func remove(_ value: String) -> Void {
        guard let range = self.range(of: value) else { return }
        self.removeSubrange(range)
//        return self
    }
    
    /// 移除第一个搜索到的字符串，返回结果
    public func removed(_ value: String) -> String {
        guard let range = self.range(of: value) else { return self }
        var result = self
        result.removeSubrange(range)
        return result
    }
    
    /// 去掉所有空格
    public func removeBlank() -> String {
        return (self as NSString).replacingOccurrences(of: " ", with: "")
    }
    
    /// url拼接
    public func join(url: String? ...) -> String {
        return self + (self.hasSuffix("/") ? "" : "/") + url.compactMap { $0 }.joined(separator: "/")
    }
    
    public var cgFloat: CGFloat {
        var cgFloat: CGFloat = 0
        if let doubleValue = Double(self) {
            cgFloat = CGFloat(doubleValue)
        }
        return cgFloat
    }
}

// MARK: - 文件Url操作

extension String {
    /// 文件大小
    public var fileSize: UInt64 {
        guard self.fileExists else { return 0 }
        
        do {
            let dict = try FileManager.default.attributesOfItem(atPath: self) as NSDictionary
            return dict.fileSize()
        } catch {
            return 0
        }
    }
    
    /// 判断文件是否存在，同时判断是否包含"file://"
    public var fileExists: Bool {
        let fileUrl = URL(fileURLWithPath: self)
        if fileUrl.isFileURL {
            return FileManager.default.fileExists(atPath: fileUrl.path)
        }
        return FileManager.default.fileExists(atPath: self)
    }
    
    public var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
    
    public func appendingPathComponent(_ value: String) -> String {
        if value == "" {
            return self
        } else if (self.hasSuffix("/") && !value.hasPrefix("/")) || (!self.hasSuffix("/") && value.hasPrefix("/")) {
            return self + value
        } else if self.hasSuffix("/") && value.hasPrefix("/") {
            return String(self.dropLast()) + value
        } else {
            return self + "/" + value
        }
    }
}

// MARK: - 指针操作

extension String {
    public func charValue() -> UnsafePointer<Int8>? {
        return (self as NSString).utf8String
    }
    
    public func mutableCharValue() -> UnsafeMutablePointer<Int8>? {
        let utf8Pointer = (self as NSString).utf8String
        let buffer = UnsafeMutablePointer<Int8>(mutating: utf8Pointer)
        return buffer
    }
    
    public func unsafeMutableRawPointer() -> UnsafeMutableRawPointer? {
        let value = NSString(string: self)
        return Unmanaged<AnyObject>.passUnretained(value as AnyObject).toOpaque()
    }
}

// MARK: - 正则表达式验证

extension String {
    public func isValidate(with regex: String, options: NSRegularExpression.Options = []) -> Bool {
        guard let pattern = try? NSRegularExpression(pattern: regex, options: options) else { return false }
        return pattern.numberOfMatches(in: self, options: [], range: NSRange(location: 0, length: self.count)) > 0
    }
    
    /// 验证是否电话号码
    public func isValidPhoneNumber() -> Bool {
        return self.isValidate(with: "^((13[0-9])|(147)|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$", options: [])
    }
    
    /// 数字
    public func isValidNumber() -> Bool {
        return self.isValidate(with: "^[0-9]*$")
    }
    
    /// 数字，限制固定长度
    public func isValidNumber(limit: Int) -> Bool {
        return self.isValidate(with: "^\\d{\(limit)}$")
    }
    
    /// 数字，限制最大长度
    public func isValidNumber(max: Int) -> Bool {
        return self.isValidate(with: "^\\d{0,\(max)}$")
    }
    
    /// 字母+数字，限制固定长度
    public func isValidLetterAndNumber(limit n: Int) -> Bool {
        return self.isValidate(with: "^[A-Za-z0-9]{\(n)}$", options: [])
    }
    
    /// 字母+数字，限制最大长度
    public func isValidLetterAndNumber(max n: Int) -> Bool {
        return self.isValidate(with: "^[A-Za-z0-9]{0,\(n)}$", options: [])
    }
    
    /// 是否包含HTML标签，效果存疑
    public func isValidHTML() -> Bool {
        return self.isValidate(with: "<(S*?)[^>]*>.*?|<.*? />")
    }
}

extension NSString {
    /// 验证是否电话号码
    @objc public func isValidPhoneNumber() -> Bool {
        return (self as String).isValidPhoneNumber()
    }
    
    /// 数字
    @objc public func isValidNumber() -> Bool {
        return (self as String).isValidNumber()
    }
    
    /// 数字，限制固定长度
    @objc public func isValidNumber(limit: Int) -> Bool {
        return (self as String).isValidNumber(limit: limit)
    }
    
    /// 数字，限制最大长度
    @objc public func isValidNumber(max: Int) -> Bool {
        return (self as String).isValidNumber(max: max)
    }
    
    /// 字母+数字，限制固定长度
    @objc public func isValidLetterAndNumber(limit n: Int) -> Bool {
        return (self as String).isValidLetterAndNumber(limit: n)
    }
    
    /// 字母+数字，限制最大长度
    @objc public func isValidLetterAndNumber(max n: Int) -> Bool {
        return (self as String).isValidLetterAndNumber(max: n)
    }
    
    /// 是否包含HTML标签，效果存疑
    @objc public func isValidHTML() -> Bool {
        return (self as String).isValidHTML()
    }
}

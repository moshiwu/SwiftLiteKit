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
        return (self as NSString).substring(with: NSMakeRange(from, self.characters.count - from))
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
    
    #if swift(>=3.2)
//    @available(swift 3.2)
//    public func substring(with: CountableRange<Int>) -> String {
//        return self.substring(with: with.toNSRange())
//    }
//
//    @available(swift 3.2)
//    public func substring(with: CountableClosedRange<Int>) -> String {
//        return self.substring(with: with.toNSRange())
//    }
    
    #endif
    
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
    
    #if swift(>=3.2)
    
    // MARK: subscript for swift 3.2 range
    
//    @available(swift 3.2)
//    public subscript(r: CountableRange<Int>) -> String { return self.substring(with: r) }
//    
//    @available(swift 3.2)
//    public subscript(r: CountableClosedRange<Int>) -> String { return self.substring(with: r) }
    #endif
    
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
    
    /// 去掉所有空格
    public func removeBlank() -> String {
        return (self as NSString).replacingOccurrences(of: " ", with: "")
    }
    
    public func join(url: String? ...) -> String {
        return self + (self.hasSuffix("/") ? "" : "/") + url.compactMap { $0 }.joined(separator: "/")
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
    
    public func isValidPhoneNumber() -> Bool {
        return self.isValidate(with: "^((13[0-9])|(147)|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$", options: [])
    }
}

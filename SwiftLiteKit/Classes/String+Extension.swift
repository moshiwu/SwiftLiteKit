//
//  String+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/8/24.
//

import Foundation

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
    @available(swift 3.2)
    public func substring(with: CountableRange<Int>) -> String {
        return self.substring(with: with.toNSRange())
    }
    
    @available(swift 3.2)
    public func substring(with: CountableClosedRange<Int>) -> String {
        return self.substring(with: with.toNSRange())
    }
    
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

extension String {
    
    // MARK: - subscript for swift 3.2 range
    @available(swift 3)
    public subscript(r: Range<Int>) -> String { return self.substring(with: r) }
    
    @available(swift 3)
    public subscript(r: ClosedRange<Int>) -> String { return self.substring(with: r) }
    
    #if swift(>=3.2)
    // MARK: - subscript for swift 3.2 range
    @available(swift 3.2)
    public subscript(r: CountableRange<Int>) -> String { return self.substring(with: r) }
    
    @available(swift 3.2)
    public subscript(r: CountableClosedRange<Int>) -> String { return self.substring(with: r) }
    #endif
    
    #if swift(>=4.0)
    // MARK: - subscript for swift 4 range
    @available(swift 4)
    public subscript(r: CountablePartialRangeFrom<Int>) -> String { return self.substring(with: r) }
    
    @available(swift 4)
    public subscript(r: PartialRangeUpTo<Int>) -> String { return self.substring(with: r) }
    
    @available(swift 4)
    public subscript(r: PartialRangeThrough<Int>) -> String { return self.substring(with: r) }
    #endif
}

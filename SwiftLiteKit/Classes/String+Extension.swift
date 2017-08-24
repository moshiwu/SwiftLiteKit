//
//  String+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/8/24.
//

import Foundation

extension String {
    public func substring(to: Int) -> String {
        return (self as NSString).substring(with: NSMakeRange(0, to))
    }
    
    public func substring(from: Int) -> String {
        return (self as NSString).substring(with: NSMakeRange(from, self.count - from))
    }
    
    public func substring(with: NSRange) -> String {
        return (self as NSString).substring(with: with)
        
    }
    public func substring(with: Range<Int>) -> String {
        return self.substring(with: with.toNSRange())
    }
    
    public func substring(with: CountableRange<Int>) -> String {
        return self.substring(with: with.toNSRange())
    }
    
    public func substring(with: CountableClosedRange<Int>) -> String {
        return self.substring(with: with.toNSRange())
    }
    
    public func substring(with: ClosedRange<Int>) -> String {
        return self.substring(with: with.toNSRange())
    }
}

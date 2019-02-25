//
//  Data+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/8/31.
//

import UIKit

extension Data {
    public func subdata(in range: CountableClosedRange<Data.Index>) -> Data {
        return self.subdata(in: range.lowerBound..<range.upperBound + 1)
    }
}

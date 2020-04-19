//
//  Data+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2017/8/31.
//

import UIKit

extension Data {
    public init?(contentOfFileInMainBundle name: String?) {
        guard
            let name = name,
            let url = Bundle.main.url(forResource: name, withExtension: nil)
        else { return nil }

        try? self.init(contentsOf: url)
    }

    public func subdata(in range: CountableClosedRange<Data.Index>) -> Data {
        return subdata(in: range.lowerBound ..< range.upperBound + 1)
    }

    /// 将Data的二进制转成十进制的Int，最多只转换8字节（64位）的Data，超长返回-1
    public var decimalInt: Int {
        guard count <= 8 else { return -1 }
        var s = 0
        for (i, unit) in reversed().enumerated() {
            s = s + (Int(unit) << (i * 8))
        }
        return s
    }
}

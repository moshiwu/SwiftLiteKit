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
}

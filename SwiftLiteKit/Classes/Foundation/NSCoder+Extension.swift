//
//  NSCoder+Extension.swift
//  Alamofire
//
//  Created by 莫锹文 on 2020/3/8.
//

import Foundation

extension NSCoder {
    open func decodeString(forKey key: String) -> String? {
        return decodeObject(forKey: key) as? String
    }
}

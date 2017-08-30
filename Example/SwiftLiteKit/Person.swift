//
//  Person.swift
//  SwiftLiteKit_Example
//
//  Created by 莫锹文 on 2017/8/30.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit
import SwiftLiteKit

enum Sexy: String, Codable {
    case male, female
}

class PersonClass: NSObject, Codable {
    var name = "name1"
    var sex: Sexy = .male
    
    var son = PersonStruct()
}

struct PersonStruct: Codable {
    var name = "name2"
    var sex: Sexy = .female

//    var daughter = PersonClass()

}

// Only a demo for custom encode/decoder
// Enum with Codable not recommended.
// Enum is not implements Decodable/Encodable by default. You must do it by yourself and leading to illogical problems
// enum 默认不会实现Decodable/Encodable，如果要用的话需要自己实现，但是把enum当成class/struct来使用明显就已经不符合enum的设计初衷，而且如果enum的绑定值超过1个，这里的实现方式就有问题了
enum EnumSample: Codable {

    // key for custom encode/decoder
    enum CodingKeys: String, CodingKey {
        case messageKey
        case codeKey
        case otherKey
    }

    case defaultValue
    case message(String)
    case code(Int)

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        if values.allKeys.contains(.messageKey) {
            let value = try values.decode(String.self, forKey: CodingKeys.messageKey)
            self = .message(value)
        } else if values.allKeys.contains(.codeKey) {
            let value = try values.decode(Int.self, forKey: CodingKeys.codeKey)
            self = .code(value)
        } else {
            self = .defaultValue
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .message(let value):
            try container.encode(value, forKey: .messageKey)
        case .code(let value):
            try container.encode(value, forKey: .codeKey)
        case .defaultValue:
            // print("do nothing")
            break
        }
    }

}

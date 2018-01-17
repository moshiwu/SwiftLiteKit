//
//  ViewController.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 08/24/2017.
//  Copyright (c) 2017 莫锹文. All rights reserved.
//

import UIKit
import SwiftLiteKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Substring with Range
        //        testSubstringWithRange()
        
        // MARK: - transform json to model
        //        testCodable()
        
        // MARK: - subdata extension
        //        testSubdata()
        
        // MARK: - Dictionary extension
        testDictionary()
        
        
        
    }
    
    func testSubstringWithRange() {
        let str = "0123456789"
        
        let range6: Range<Int> = 1..<5
        let range7: CountableClosedRange<Int> = 1...5
        let range8: CountableRange<Int> = 1..<5
        let range9: ClosedRange<Int> = 1...5
        
        print(str.substring(with: range6))
        
        #if swift(>=3.2)
            print(str.substring(with: range7))
            print(str.substring(with: range8))
        #endif
        print(str.substring(with: range9))
        print(str)
        
        print(str.substring(with: 1..<5))
        print(str.substring(with: 1...5))
        
        let b = str.substring(to: 5)
        print(str)
        print(b)
        
    }
    
    func testCodable() {
        
        let p1 = PersonClass()
        let p2 = PersonStruct()
        
        let json1 = p1.jsonString!
        let json2 = p2.jsonString!
        
        print("p1 jsonString : \(json1)")
        print("p2 jsonString : \(json2)")
        
        let p1_decode = PersonClass.modelWithJSON(json: json1)
        let p2_decode = PersonStruct.modelWithJSON(json: json2)
        
        print("p1 decode : \(p1_decode!.name) \(p1_decode!.sex) \(p1_decode!.son)")
        print("p2 decode : \(p2_decode!.name) \(p2_decode!.sex)")
        
        let enum1 = EnumSample.defaultValue
        let enum2 = EnumSample.message("testEnum")
        let enum3 = EnumSample.code(9527)
        
        let json_enum_1 = enum1.jsonString!
        let json_enum_2 = enum2.jsonString!
        let json_enum_3 = enum3.jsonString!
        
        print("enum1 jsonString : \(json_enum_1)")
        print("enum2 jsonString : \(json_enum_2)")
        print("enum3 jsonString : \(json_enum_3)")
        
        let enum1_decode = EnumSample.modelWithJSON(json: json_enum_1)
        let enum2_decode = EnumSample.modelWithJSON(json: json_enum_2)
        let enum3_decode = EnumSample.modelWithJSON(json: json_enum_3)
        
        print("enum1 decode : \(enum1_decode!)")
        print("enum2 decode : \(enum2_decode!)")
        print("enum3 decode : \(enum3_decode!)")
        
    }
    
    func testSubdata() {
        let array: [UInt8] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06]
        let data = Data(bytes: array)
        
        data.subdata(in: 3...4).forEach { print("a \($0)") } // This will be error without extension
        data.subdata(in: 3..<3).forEach { print("b \($0)") }
        data.subdata(in: 3..<4).forEach { print("c \($0)") }
        data[3...4].forEach { print("A \($0)") }
        data[3..<3].forEach { print("B \($0)") }
        data[3..<4].forEach { print("C \($0)") }
        
        print("\(data as! NSData)")
    }
    
    func testDictionary() {
        var dict1 = ["first": "xiaoming", "second": "xiaohua"]
        var dict2 = ["first": "xiaoming-2", "second": "xiaohua-2"]
        
        //        dict1.merge(dict2)
        
        //        dict1.merge(dict2) { + }
        //        print(dict1)
        
        dict1.merge(dict1, uniquingKeysWith: +)
        
        var s1: String = "1"
        var s2 = "2"
        
        print(s1 + s2)
        
    }
}

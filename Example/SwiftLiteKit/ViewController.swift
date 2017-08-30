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
        testSubstringWithRange()
        
        // MARK: - transform json to model
        testCodable()
    }
    
    func testSubstringWithRange() {
        let str = "0123456789"
        
        let range6: Range<Int> = 1..<5
        let range7: CountableClosedRange<Int> = 1...5
        let range8: CountableRange<Int> = 1..<5
        let range9: ClosedRange<Int> = 1...5
        
        print(str.substring(with: range6))
        print(str.substring(with: range7))
        print(str.substring(with: range8))
        print(str.substring(with: range9))
        print(str)
        
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
}

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

        var str = "0123456789"

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//
//  NSObject+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2018/3/13.
//

extension NSObject: SwiftLiteKitCompatible {}

extension String {
    // 已有unsafeMutableRawPointer()，但cocoapods验证时候有bug
    fileprivate func _unsafeMutableRawPointer() -> UnsafeMutableRawPointer? {
        let value = NSString(string: self)
        return Unmanaged<AnyObject>.passUnretained(value as AnyObject).toOpaque()
    }
}

extension SwiftLiteKit where Base: NSObject {
    // key要求的是指针，String在Swift作为结构体，如果直接使用虽然不会报错，但自动转成的指针地址会改变，因此要额外处理
    // 方式一：String + 用本框架写的unsafeMutableRawPointer()  (String转成NSString，相同字符串的NSString的指针相同)

    public func getAssociate(with key: String) -> Any? {
        return objc_getAssociatedObject(self.base, key._unsafeMutableRawPointer()!)
    }

    public func setAssociate(value: Any?, key: String) {
        objc_setAssociatedObject(self.base, key._unsafeMutableRawPointer()!, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    public func setCopyAssociate(value: Any?, key: String) {
        objc_setAssociatedObject(self.base, key._unsafeMutableRawPointer()!, value, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }

    public func setWeakAssociate(value: Any?, key: String) {
        objc_setAssociatedObject(self.base, key._unsafeMutableRawPointer()!, value, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
    }

    public func removeAssociates() {
        objc_removeAssociatedObjects(self.base)
    }

    // 方式二：
    //
    // 1. 定义存在于整个app生命周期的变量，如struct static let / private let
    //
    //    struct AssociateKey {
    //        static var key = "key1"
    //    }
    //
    //    private let key: Void?
    //
    // 2. 传入&key
    // objc_getAssociatedObject(self, &key1)
    // objc_setAssociatedObject(self, &key2, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
}

//
//  NSObject+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2018/3/13.
//

extension NSObject: SwiftLiteKitCompatible {}

extension SwiftLiteKit where Base: NSObject {
    // key要求的是指针，String在Swift作为结构体，如果直接使用虽然不会报错，但自动转成的指针地址会改变，因此要额外处理
    // let String可以用unsafeMutableRawPointer()
    // var String直接用&value即可

    public func getAssociate(with key: String) -> Any? {
        return objc_getAssociatedObject(self.base, key.unsafeMutableRawPointer()!)
    }

    public func setAssociate(value: Any?, key: String) {
        var key = key
        objc_setAssociatedObject(self.base, &key, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    public func setCopyAssociate(value: Any?, key: String) {
        objc_setAssociatedObject(self.base, key.unsafeMutableRawPointer()!, value, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    
    public func setWeakAssociate(value: Any?, key: String) {
        objc_setAssociatedObject(self.base, key.unsafeMutableRawPointer()!, value, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
    }

    public func removeAssociates() {
        objc_removeAssociatedObjects(self.base)
    }
}

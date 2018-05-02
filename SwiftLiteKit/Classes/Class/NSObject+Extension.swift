//
//  NSObject+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2018/3/13.
//

extension NSObject: SwiftLiteKitCompatible {}

extension SwiftLiteKit where Base : NSObject
{
    public func getAssociate(with key: String) -> Any?
    {
        return objc_getAssociatedObject(self.base, key)
    }

    public func setAssociate(value: Any?, key: String)
    {
        objc_setAssociatedObject(self.base, key, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    public func setWeakAssociate(value: Any?, key: String)
    {
        objc_setAssociatedObject(self.base, key, value, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
    }

    public func removeAssociates()
    {
        objc_removeAssociatedObjects(self.base)
    }
}

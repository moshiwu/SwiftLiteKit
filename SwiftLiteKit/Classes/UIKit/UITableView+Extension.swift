//
//  UITableView+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/21.
//

import UIKit

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public extension UITableView {
    class func emptyView() -> UIView {
        return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.001))
    }

    func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func register<T: UITableViewCell>(viewType: T.Type) where T: Reusable {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    func dequeue<T: UITableViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T where T: Reusable {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type) -> T? where T: Reusable {
        return (dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T)
    }
}

//
//  UIViewController+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/23.
//

import UIKit

public extension UIViewController {
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   ok: String! = "确定",
                   okClosure: ((UIAlertAction) -> Void)? = nil,
                   cancel: String? = nil,
                   cancelClosure: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        if let cancel = cancel {
            alert.addAction(UIAlertAction(title: cancel, style: .cancel, handler: cancelClosure))
        }
        if let ok = ok {
            alert.addAction(UIAlertAction(title: ok, style: .default, handler: okClosure))
        }

        present(alert, animated: true, completion: nil)
    }

    func find<T: UIViewController>(_ type: T.Type) -> T? {
        var nav: UINavigationController?
        if let temp = self as? UINavigationController {
            nav = temp
        } else {
            nav = navigationController
        }

        return nav?.viewControllers
            .filter { $0.classForCoder == type }
            .map { $0 as! T }.first
    }

    func dismissViewController(animated:Bool = true) {
        if let navigationController = self.navigationController, navigationController.viewControllers.first != self {
            navigationController.popViewController(animated: animated)
        } else if presentingViewController != nil {
            dismiss(animated: animated, completion: nil)
        }
    }
}

//
//  UICollectionView+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/10/21.
//

import UIKit

public extension UICollectionView {
    func register<T: UICollectionViewCell>(cellType: T.Type) where T: Reusable {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func register<T: UICollectionReusableView>(viewType: T.Type, forSupplementaryViewOfKind elementKind: String) where T: Reusable {
        register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
    }

    func dequeue<T: UICollectionViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T where T: Reusable {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(viewType: T.Type, ofKind elementKind: String, for indexPath: IndexPath) -> T where T: Reusable {
        return dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}

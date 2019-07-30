//
//  UIImage+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/3/12.
//

import UIKit

private let suffix = ["", "@3x.png", "@2x.png", ".png", "@3x.jpg", "@2x.jpg", ".jpg"]

extension UIImage {
    /// 加载不在main bundle的一个便利方法
    ///
    /// - Parameters:
    ///   - module: 传入调用的类，即Module所在的类
    public convenience init?(named name: String?, at module: AnyClass!, compatibleWith traitCollection: UITraitCollection? = nil) {
        guard let name = name else { return nil }
        let bundle = Bundle(for: module)
        self.init(named: name, in: bundle, compatibleWith: traitCollection)
    }

    /// 加载不在main bundle的一个便利方法
    ///
    /// - Parameters:
    ///   - bundleIdentifier: bundle的id，组件化时候一般是"org.cocoapods."+模组名
    public convenience init?(named name: String?, at bundleIdentifier: String, compatibleWith traitCollection: UITraitCollection? = nil) {
        guard let name = name else { return nil }
        let bundle = Bundle(identifier: bundleIdentifier)
        self.init(named: name, in: bundle, compatibleWith: traitCollection)
    }

    /// 无缓存加载图片，带简单的文件名检测，注意这种用法每一个UIImage实例都要占用一份内存 (区别于UIImage(named:) 是使用缓存，相同名字的实例共享一份内存）
    public convenience init?(withoutCache name: String, bundle: Bundle = .main) {
        guard let path = suffix.compactMap({ bundle.path(forResource: name + $0, ofType: nil) }).first else {
            return nil
        }
        self.init(contentsOfFile: path)
    }

    /// 给OC用的版本，Main Bundle
    @objc public class func imageWithoutCache(_ name: String) -> UIImage? {
        return UIImage(withoutCache: name)
    }

    /// 中心切片拉伸
    @objc public func centerSliced() -> UIImage? {
        // 设置端盖的值
        let top: CGFloat = size.height * 0.5
        let left: CGFloat = size.width * 0.5
        let bottom: CGFloat = size.height * 0.5
        let right: CGFloat = size.width * 0.5
        // 设置端盖的值
        let edgeInsets: UIEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        // 设置拉伸的模式
        let mode: UIImage.ResizingMode = .stretch
        // 拉伸图片
        return resizableImage(withCapInsets: edgeInsets, resizingMode: mode)
    }

    @objc public class func imageWithCenterSliced(_ name: String) -> UIImage? {
        return UIImage(named: name)?.centerSliced()
    }

    /// 创建一个圆角大小固定，可以拉伸的UIImage
    public class func resizebleCornerMaskImage(cornerRadius: CGFloat, byRoundingCorners corners: UIRectCorner = [.allCorners], cornerColor: UIColor = .white) -> UIImage? {
        let width = cornerRadius * 2 + 1
        let height = cornerRadius * 2 + 1
        
        let rect1 = CGRect(x: 0, y: 0, width: width, height: height)
        let rect2 = CGRect(x: -1, y: -1, width: width + 2, height: height + 2)
        
        UIGraphicsBeginImageContextWithOptions(rect1.size, false, 0)
        
        let path1 = UIBezierPath(rect: rect1)
        cornerColor.setFill()
        path1.fill()
        
        let path2 = UIBezierPath(roundedRect: rect2, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        cornerColor.setFill()
        path2.fill(with: .clear, alpha: 1)
        
        let capInsets = UIEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius)
        return UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: capInsets, resizingMode: .stretch)
    }
}

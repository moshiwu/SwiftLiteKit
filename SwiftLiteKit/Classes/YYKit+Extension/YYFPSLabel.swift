//
//  YYFPSLabel.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/7/22.
//

import YYKit

/// 摘自YYText的Demo
public class YYFPSLabel: UILabel {
    private var link: CADisplayLink!
    private var count: UInt = 0
    private var lastTime: TimeInterval = 0.0
    private var _font: UIFont?
    private var _subFont: UIFont?

    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.cornerRadius = 5
        clipsToBounds = true
        textAlignment = .center

        isUserInteractionEnabled = false
        backgroundColor = UIColor(white: 0.0, alpha: 0.7)

        _font = UIFont(name: "Menlo", size: 14)
        _subFont = UIFont(name: "Menlo", size: 4)

        if _font == nil {
            _font = UIFont(name: "Courier", size: 14)
            _subFont = UIFont(name: "Courier", size: 4)
        }

        link = CADisplayLink(target: YYWeakProxy(target: self), selector: #selector(YYFPSLabel.tick(_:)))
        link.add(to: .main, forMode: .common)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        link.invalidate()
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: 55, height: 20)
    }

    @objc func tick(_ link: CADisplayLink) {
        if lastTime == 0.0 {
            lastTime = link.timestamp
            return
        }

        count += 1
        let delta = link.timestamp - lastTime
        if delta < 1 {
            return
        }

        lastTime = link.timestamp
        let fps: Double = Double(count) / delta

        count = 0

        let progress: Double = fps / 60.0
        let textColor = UIColor(hue: CGFloat(0.27 * (progress - 0.2)), saturation: 1, brightness: 0.9, alpha: 1)

        let str = String(format: "%.0f FPS", fps)
        let text = NSMutableAttributedString(string: str)
        text.setColor(textColor, range: NSRange(location: 0, length: text.length - 3))
        text.setColor(.white, range: NSRange(location: text.length - 3, length: 3))
        text.font = _font
        text.setFont(_subFont, range: NSRange(location: text.length - 4, length: 1))

        attributedText = text
    }
}

extension YYFPSLabel {
    public static let shared = YYFPSLabel(frame: .zero)

    /// 默认显示，位于屏幕右上角
    public func show() {
        guard let window = UIApplication.shared.keyWindow else { return }

        window.subviews.filter { $0 is YYFPSLabel }.forEach { $0.removeFromSuperview() }
        window.rootViewController?.view.subviews.filter { $0 is YYFPSLabel }.forEach { $0.removeFromSuperview() }

        sizeToFit()

        window.addSubview(self)
        right = UIScreen.main.bounds.width - 5
        top = window.rootViewController?.topLayoutGuide.length ?? 0
    }
}

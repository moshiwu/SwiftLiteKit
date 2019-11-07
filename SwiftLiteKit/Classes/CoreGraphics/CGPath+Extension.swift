//
//  CGPath+Extension.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/11/7.
//

import Foundation

// COPY FROM https://gist.github.com/markd2/7bd2a5e2969b000f296828b3bcbf49f8

extension CGPath {
    func dump() {
        apply(info: nil) { _, unsafeElement in
            let element = unsafeElement.pointee

            switch element.type {
                case .moveToPoint:
                    let point = element.points[0]
                    log.debug("moveto - \(point)")
                case .addLineToPoint:
                    let point = element.points[0]
                    log.debug("lineto - \(point)")
                case .addQuadCurveToPoint:
                    let control = element.points[0]
                    let point = element.points[1]
                    log.debug("quadCurveTo - \(point) - \(control)")
                case .addCurveToPoint:
                    let control1 = element.points[0]
                    let control2 = element.points[1]
                    let point = element.points[2]
                    log.debug("curveTo - \(point) - \(control1) - \(control2)")
                case .closeSubpath:
                    log.debug("close")
                @unknown default:
                    break
            }
        }
    }
}

//
//  Logger.swift
//  SwiftLiteKit
//  定义调试用的logger
//
//  Created by 莫锹文 on 2018/4/17.
//

import SwiftyBeaver

/// 输出到Xcode控制台的，同步，最低输出debug级别（verbose不输出）
public class SLKConsoleDestination: BaseDestination {
    public override var defaultHashValue: Int { return 1 }

    public override init() {
        super.init()
        levelColor.verbose = "💜" // silver
        levelColor.debug = "💚" // green
        levelColor.info = "💙" // blue
        levelColor.warning = "💛" // yellow
        levelColor.error = "❤️" // red

        minLevel = .debug
        #if DEBUG
            asynchronously = false
        #endif
    }

    public override func send(_ level: SwiftyBeaver.Level, msg: String, thread: String,
                              file: String, function: String, line: Int, context: Any? = nil) -> String? {
        let formattedString = super.send(level, msg: msg, thread: thread.isEmpty ? "Main" : thread, file: file, function: function, line: line, context: context)

        if let str = transformString(formattedString) {
            print(str)
        }
        return formattedString
    }

    // Unicode To String
    func transformString(_ value: String?) -> String? {
        guard let value = value else { return "" }
        let s = value.replacingOccurrences(of: "\\U", with: "\\u", options: [], range: value.range(of: value))
        let cfstring = NSMutableString(string: s) as CFMutableString
        CFStringTransform(cfstring, nil, "Any-Hex/Java" as CFString, true)

        return cfstring as String
    }
}

private let consoleDestination = SLKConsoleDestination()

private let logger: SwiftyBeaver.Type = {
    let instance = SwiftyBeaver.self
    #if DEBUG
        print("add consoleDestination")
        instance.addDestination(consoleDestination)
    #endif
    return instance
}()

// https://docs.swiftybeaver.com/article/20-custom-format
public var log: SwiftyBeaver.Type {
    consoleDestination.format = "[$C$DHH:mm:ss.SSS$d$c][$T][$N($l) $F] : $M"
    for dest in logger.destinations where dest != consoleDestination {
        dest.format = "[$Dyyyy-MM-dd HH:mm:ss.SSS$d][$T][$N($l) $F] : $M"
    }
    return logger
}

public var deinitLog: SwiftyBeaver.Type {
    consoleDestination.format = "[$C$DHH:mm:ss.SSS$d$c][$T] : [对象销毁]$M"
    for dest in logger.destinations where dest != consoleDestination {
        dest.format = "[$Dyyyy-MM-dd HH:mm:ss.SSS$d][$T] : [对象销毁]$M"
    }
    return logger
}

public var moyaLog: SwiftyBeaver.Type {
    consoleDestination.format = "[$C$DHH:mm:ss.SSS$d$c][$T] : $M"
    for dest in logger.destinations where dest != consoleDestination {
        dest.format = "[$Dyyyy-MM-dd HH:mm:ss.SSS$d][$T] : $M"
    }
    return logger
}

private var date = Date()

extension SwiftyBeaver {
    public class func logTimeStart() {
        #if DEBUG
            date = Date()
        #endif
    }

    public class func logTimeEnd() {
        #if DEBUG
            let nowDate = Date()
            let ms = nowDate.timeIntervalSince(date) * 1000
            debug(String(format: "%.2f", ms) + " ms")
        #endif
    }

    public class func logTimeIn(_ block: () -> Void) {
        logTimeStart()
        block()
        logTimeEnd()
    }
}

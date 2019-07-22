//
//  YYKit+Date.swift
//  SwiftLiteKit
//
//  Created by 莫锹文 on 2019/7/22.
//

import YYKit

// MARK: - YYKit扩展的是NSDate，因此没对Swift的Date扩展，采用以下方法来兼容

extension Date {
    public var year: Int { return (self as NSDate).year }
    public var month: Int { return (self as NSDate).month }
    public var day: Int { return (self as NSDate).day }
    public var hour: Int { return (self as NSDate).hour }
    public var minute: Int { return (self as NSDate).minute }
    public var second: Int { return (self as NSDate).second }
    public var nanosecond: Int { return (self as NSDate).nanosecond }
    public var weekday: Int { return (self as NSDate).weekday }
    public var weekdayOrdinal: Int { return (self as NSDate).weekdayOrdinal }
    public var weekOfMonth: Int { return (self as NSDate).weekOfMonth }
    public var weekOfYear: Int { return (self as NSDate).weekOfYear }
    public var yearForWeekOfYear: Int { return (self as NSDate).yearForWeekOfYear }
    public var quarter: Int { return (self as NSDate).quarter }
    public var isLeapMonth: Bool { return (self as NSDate).isLeapMonth }
    public var isLeapYear: Bool { return (self as NSDate).isLeapYear }
    public var isToday: Bool { return (self as NSDate).isToday }
    public var isYesterday: Bool { return (self as NSDate).isYesterday }
    public func addingYears(_ years: Int) -> Date? { return (self as NSDate).addingYears(years) }
    public func addingMonths(_ months: Int) -> Date? { return (self as NSDate).addingMonths(months) }
    public func addingWeeks(_ weeks: Int) -> Date? { return (self as NSDate).addingWeeks(weeks) }
    public func addingDays(_ days: Int) -> Date? { return (self as NSDate).addingDays(days) }
    public func addingHours(_ hours: Int) -> Date? { return (self as NSDate).addingHours(hours) }
    public func addingMinutes(_ minutes: Int) -> Date? { return (self as NSDate).addingMinutes(minutes) }
    public func addingSeconds(_ seconds: Int) -> Date? { return (self as NSDate).addingSeconds(seconds) }
    public func string(withFormat format: String) -> String? { return (self as NSDate).string(withFormat: format) }
    public func string(withFormat format: String, timeZone: TimeZone?, locale: Locale?) -> String? { return (self as NSDate).string(withFormat: format, timeZone: timeZone, locale: locale) }
    public func stringWithISOFormat() -> String? { return (self as NSDate).stringWithISOFormat() }
}

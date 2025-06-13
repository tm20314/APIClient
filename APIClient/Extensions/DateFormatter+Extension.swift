//
//  DateFormatter+Extension.swift
//  Junbi8
//
//  Created by Yusei Tsumori on 2025/04/21.
//

import Foundation

extension DateFormatter {
    static func standardWithDateFormat(_ dateFormat: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        dateFormatter.calendar = .init(identifier: .gregorian)
        dateFormatter.dateFormat = dateFormat
        return dateFormatter
    }

    /// YYYY/MM/dd形式のフォーマット
    static let yearMonthDayWithPaddingSeparator: DateFormatter = {
        return standardWithDateFormat("yyyy/MM/dd")
    }()
}

//
//  JSONDecoder.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 23.05.2024.
//

import Foundation

class UnknownJSONDecoder: JSONDecoder {
    override init() {
        super.init()
        self.dateDecodingStrategy = .formatted(UnknownDateFormatter())
    }
}

struct UnknownDateTimeFormatter {
    enum Format: String {
        case yearOnly = "yyyy"
        case dateOnly = "MM / yyyy"
        case monthOnlyShort = "MMM"
        case monthAndYearShort = "MMM '`'yy"
        case monthOnlyFull = "MMMM"
        case monthAndYearFull = "MMMM '`'yy"
        case timeOnly = "HH:mm"
        case shortMonthAndTime = "dd MMM 'at' HH:mm"
        case groupingDate = "yyyy MM dd"
        case analyticMonth = "yyyy-MM-dd"
    }
        
    private let formatter = DateFormatter()

    func string(from date: Date, outputFormat format: UnknownDateTimeFormatter.Format) -> String {
        formatter.locale = .current
        formatter.timeZone = .current
        formatter.dateFormat = format.rawValue
        return formatter.string(from: date)
    }
    
    func date(from string: String, inputFormat format: UnknownDateTimeFormatter.Format) -> Date? {
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = format.rawValue
        return formatter.date(from: string)
    }
    
}

class BackendDateParser {
    
    private static let dateFormatter = DateFormatter()
    private static let formats = ["yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd'T'HH:mm:ssZ", "yyyy-MM-dd"]
    
    static func date(from dateString: String?) -> Date? {
        guard let dateString = dateString else { return nil }
        for format in formats {
            dateFormatter.dateFormat = format
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            if let date = dateFormatter.date(from: dateString) {
                return date
            }
        }
        return nil
    }
}

class UnknownDateFormatter: DateFormatter {
    
    let iso8601DateFormatter = ISO8601DateFormatter()
    let dateOnlyDateFormatter = DateFormatter()
    let dateWithDotDateFormatter = DateFormatter()
    let dateWithDotAlternativeDateFormatter = DateFormatter()

    override init() {
        super.init()
        dateOnlyDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateOnlyDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateOnlyDateFormatter.dateFormat = "yyyy-MM-dd"
        dateWithDotDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateWithDotDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateWithDotDateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.sssZ" // 2021-06-01T00:00:00.000Z
        dateWithDotAlternativeDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func date(from string: String) -> Date? {
        if let date = iso8601DateFormatter.date(from: string) { return date }
        if let date = dateOnlyDateFormatter.date(from: string) { return date }
        if let date = dateWithDotDateFormatter.date(from: string) { return date }
        if let date = dateWithDotAlternativeDateFormatter.date(from: string) { return date }
        return nil
    }
    
}

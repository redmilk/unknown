//
//  Logger.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 07.07.2024.
//

import Foundation

struct Logger {

    static func log(_ text: String = "", entity: AnyObject?, symbol: String = "🌀") {
        if let pureEntityName = String(describing: entity).slice(from: ".", to: ":") {
            print("\(time()) \(symbol) \(text): \(pureEntityName)")
        } else if let pureEntityName = String(describing: entity).textAfter(str: ".") {
            print("\(time()) \(symbol) \(text): \(pureEntityName)")
        } else {
            print("\(time()) \(symbol) \(text): \(String(describing: entity))")
        }
    }
    
    static func initialization(entity: AnyObject, symbol: String = "⚠️") {
        if let pureEntityName = String(describing: entity).slice(from: ".", to: ":") {
            print("\(time()) \(symbol) init: \(pureEntityName)")
        } else if let pureEntityName = String(describing: entity).textAfter(str: ".") {
            print("\(time()) \(symbol) init: \(pureEntityName)")
        }
    }
    
    static func deinitialization(entity: AnyObject, symbol: String = "❌")  {
        if let pureEntityName = String(describing: entity).slice(from: ".", to: ":") {
            print("\(time()) \(symbol) deinit: \(pureEntityName)")
        } else if let pureEntityName = String(describing: entity).textAfter(str: ".") {
            print("\(time()) \(symbol) deinit: \(pureEntityName)")
        }
    }
    
    static private func time() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.SSS"

        return dateFormatter.string(from: Date())
    }
    
}

extension String {
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
    func textAfter(str: String) -> String? {
        if let range = self.range(of: str) {
            let extract = self[range.upperBound...]
            return String(extract)
        }
        return nil
    }
}

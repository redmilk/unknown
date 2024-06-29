//
//  Atomic.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 14.01.2024.
//

import Foundation

@propertyWrapper
struct Atomic<Value> {
    
    private var value: Value
    private let lock = NSLock()
    
    init(wrappedValue value: Value) {
        self.value = value
    }
    
    var wrappedValue: Value {
        get { read() }
        set { write(newValue) }
    }
    
    private func read() -> Value {
        lock.lock()
        defer { lock.unlock() }
        return value
    }
    
    private mutating func write(_ newValue: Value) {
        lock.lock()
        defer { lock.unlock() }
        value = newValue
    }
}

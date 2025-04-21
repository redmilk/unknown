//
//  LimitedArray.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 14.01.2024.
//

import Foundation

struct LimitedArray<T> {
    
    private(set) var storage: [T] = []
    let maxCount: Int
    var isFull: Bool { count == maxCount }
    var freeSize: Int { maxCount - count }

    init(maxCount: Int) {
        self.maxCount = maxCount
    }

    init<S: Sequence>(from other: S, maxCount: Int) where S.Element == T {
        self.maxCount = maxCount
        storage = Array(other.prefix(maxCount))
    }

    @discardableResult
    mutating func append(_ item: T) -> Bool {
        if storage.count < maxCount {
            storage.append(item)
            return true
        } else {
            return false
        }
    }

    mutating func insert(_ item: T, at index: Int) {
        storage.insert(item, at: index)
        if storage.count > maxCount {
            storage.remove(at: maxCount)
        }
    }
    
    mutating func removeAll(where shouldBeRemoved: (Element) -> Bool) {
        storage.removeAll(where: shouldBeRemoved)
    }
    
    mutating func refill<S: Sequence>(from other: S) where S.Element == T {
        storage = Array(other.prefix(maxCount))
    }
}

extension LimitedArray where T: Equatable {
    mutating func remove(_ item: T) {
        storage.remove(object: item)
    }
}

extension LimitedArray: MutableCollection {
    var startIndex: Int { return storage.startIndex }
    var endIndex: Int { return storage.endIndex }

    subscript(_ index: Int) -> T {
        get { return storage[index] }
        set { storage[index] = newValue }
    }

    func index(after i: Int) -> Int {
        return storage.index(after: i)
    }
}

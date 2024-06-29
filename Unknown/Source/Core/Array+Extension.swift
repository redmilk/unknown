//
//  Array+Extension.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 14.01.2024.
//

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }
        return self[index]
    }
    
    var lastElementIndex: Int { Swift.max((endIndex - 1), 0) }

    @discardableResult
    mutating func replace(
        where predicate: (Element) -> Bool,
        with value: Element
    ) -> Bool {
        guard let index = firstIndex(where: predicate) else {
            return false
        }
        remove(at: index)
        insert(value, at: index)
        return true
    }
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
}

extension Array where Element: Equatable {
    
    /// Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = firstIndex(of: object) {
            remove(at: index)
        }
    }
}

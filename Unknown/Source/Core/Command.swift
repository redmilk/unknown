//
//  Command.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 13.01.2024.
//

import Foundation

final class CommandWith<T> {
    private let id: String
    private let file: StaticString
    private let function: StaticString
    private let line: Int
    private let column: Int
    private let action: (T) -> Void

    init(
        file: StaticString = #file,
        function: StaticString = #function,
        line: Int = #line,
        column: Int = #column,
        action: @escaping (T) -> Void
    ) {
        self.id = makeId(file: file, function: function, line: line, column: column)
        self.action = action
        self.function = function
        self.file = file
        self.line = line
        self.column = column
    }

    init(
        id: String,
        file: StaticString = #file,
        function: StaticString = #function,
        line: Int = #line,
        column: Int = #column,
        action: @escaping (T) -> Void
    ) {
        self.id = id
        self.action = action
        self.function = function
        self.file = file
        self.line = line
        self.column = column
        let command = CommandWithReturn<Command, Int> { c in
            c.perform()
            return 1
        }
    }

    func perform(with value: T) {
        action(value)
    }

    static var nop: CommandWith<T> {
        return CommandWith<T>(id: "nop") { _ in }
    }

    @objc
    func debugQuickLookObject() -> AnyObject? {
        return """
            type: \(String(describing: type(of: self)))
            id: \(id)
            file: \(file)
            function: \(function)
            line: \(line)
            column: \(column)
            """ as NSString
    }
}

private func makeId(
    file: StaticString,
    function: StaticString,
    line: Int,
    column: Int
) -> String {
    return "\(file)_\(function)_\(line)_\(column)"
}

typealias Command = CommandWith<Void>
typealias CommandWithCompletion = CommandWith<Command>

extension CommandWith where T == Void {
    func perform() {
        perform(with: ())
    }
}

extension CommandWith: Hashable {
    static func == (left: CommandWith, right: CommandWith) -> Bool {
        return left.id == right.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension CommandWith {
    func dispatched(on queue: DispatchQueue) -> CommandWith {
        return CommandWith { [action] value in
            queue.async {
                action(value)
            }
        }
    }
}

// MARK: - CommandWithReturn

final class CommandWithReturn<T,R> {
    private let id: String
    private let file: StaticString
    private let function: StaticString
    private let line: Int
    private let column: Int
    private let action: (T) -> R

    init(
        file: StaticString = #file,
        function: StaticString = #function,
        line: Int = #line,
        column: Int = #column,
        action: @escaping (T) -> R
    ) {
        self.id = makeId(file: file, function: function, line: line, column: column)
        self.action = action
        self.function = function
        self.file = file
        self.line = line
        self.column = column
    }

    init(
        id: String,
        file: StaticString = #file,
        function: StaticString = #function,
        line: Int = #line,
        column: Int = #column,
        action: @escaping (T) -> R
    ) {
        self.id = id
        self.action = action
        self.function = function
        self.file = file
        self.line = line
        self.column = column
    }

    func perform(with value: T) -> R {
        return action(value)
    }

    @objc
    func debugQuickLookObject() -> AnyObject? {
        return """
            type: \(String(describing: type(of: self)))
            id: \(id)
            file: \(file)
            function: \(function)
            line: \(line)
            column: \(column)
            """ as NSString
    }
}

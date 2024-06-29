//
//  Publisher+Extension.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 14.01.2024.
//

import Combine

extension Publisher {
    func mapToVoid() -> AnyPublisher<Void, Failure> {
        map { _ in }.eraseToAnyPublisher()
    }
    
    func mapToOptional() -> AnyPublisher<Output?, Failure> {
        map { Optional.some($0) }.eraseToAnyPublisher()
    }
}

//
//  CoordinatorProtocol.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 07.07.2024.
//

import Foundation

protocol Coordinator: EventRouter {
    var parent: Coordinator? { get set }
    var coordinators: [Coordinator] { get set }

    func start()
}

extension Coordinator {
    func start() { }
}

extension Coordinator {
    func addCoordinator(_ coordinator: Coordinator) {
        coordinators.append(coordinator)
        coordinator.parent = self
    }

    func removeCoordinator(_ coordinator: Coordinator) {
        coordinators = coordinators.filter { $0 !== coordinator }
        coordinator.parent = nil
    }

    func removeAllCoordinators() {
        coordinators.forEach { $0.parent = nil }
        coordinators.removeAll()
    }
}

protocol CoordinatorEvent { }

protocol EventRouter: AnyObject {
    func handleEvent(_ event: CoordinatorEvent)
    func dispatchEvent(_ event: CoordinatorEvent)
}

extension EventRouter where Self: Coordinator {
    func handleEvent(_ event: CoordinatorEvent) {
        coordinators.forEach { $0.handleEvent(event) }
    }

    func dispatchEvent(_ event: CoordinatorEvent) {
        guard let parent = parent else {
            return handleEvent(event)
        }
        parent.dispatchEvent(event)
    }
}

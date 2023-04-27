//
//  BaseCoordinator.swift
//  Vehicle-Test
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

class BaseCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var router: Router?
    
    func start() {

    }
    
    // add only unique object
    func addDependency(_ coordinator: Coordinator) {
        guard !self.childCoordinators.contains(where: { $0 === coordinator }) else { return }
        self.childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard
            self.childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        // Clear child-coordinators recursively
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators.filter({ $0 !== coordinator }).forEach({
                coordinator.removeDependency($0)
            })
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            self.childCoordinators.remove(at: index)
            break
        }
    }
}

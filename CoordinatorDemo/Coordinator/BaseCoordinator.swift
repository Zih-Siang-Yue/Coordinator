//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/17.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
        
    // MARK: - Vars & Lets
    var childCoordinators = [Coordinator]()
    
    // MARK: - Public methods
    func addDependency(_ coordinator: Coordinator) {
        guard !self.childCoordinators.contains(where: { $0 === coordinator }) else { return }
        self.childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard self.childCoordinators.isEmpty == false,
            let coordinator = coordinator else {
                return
        }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    // MARK: - Coordinator
    func start() {
        start(with: nil)
    }
    
    func start(with option: DeepLinkOption?) {
        //Override
    }
    
}

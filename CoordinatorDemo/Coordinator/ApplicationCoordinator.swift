//
//  ApplicationCoordinator.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Vars & Lets
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let router: RouterProtocol
    private var launchInstructor = LaunchInstructor.configure()
    private let viewControllerFactory: ViewControllerFactory = ViewControllerFactory()
    
    // MARK: - Coordinator
    override func start(with option: DeepLinkOption?) {
        if option != nil {
            // Deep link handle
        } else {
            switch self.launchInstructor {
            case .auth: runAuthFlow()
            case .main: runMainFlow()
            case .onboarding: runOnboardingFlow()
            }
        }
    }
    
    // MARK: - Private methods
    private func runAuthFlow() {
        let coordinator: AuthCoordinator = self.coordinatorFactory.makeAuthCoordinatorBox(router: self.router, coordinatorFactory: self.coordinatorFactory, viewControllerFactory: self.viewControllerFactory)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure()
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func runMainFlow() {
        let coordinator: MainCoordinator = self.coordinatorFactory.makeMainCoordinatorBox(router: self.router, coordinatorFactory: CoordinatorFactory(), viewControllerFactory: ViewControllerFactory())
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure()
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func runOnboardingFlow() {
        let coordinator: OnboardingCoordinator = self.coordinatorFactory.makeOnboardingCoordinatorBox(router: self.router, viewControllerFactory: ViewControllerFactory())
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure()
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    // MARK: - Init
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
}

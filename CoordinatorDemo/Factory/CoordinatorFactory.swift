//
//  CoordinatorFactory.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/17.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    func makeAuthCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> AuthCoordinator {
        return AuthCoordinator(router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
    }
    
    func makeMainCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> MainCoordinator {
        return MainCoordinator(router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
    }
    
    func makeOnboardingCoordinatorBox(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) -> OnboardingCoordinator {
        return OnboardingCoordinator(router: router, viewControllerFactory: viewControllerFactory)
    }
    
    func makeForgetPwdCoordinatorBox(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) -> ForgetPwdCoordinator {
        return ForgetPwdCoordinator(router: router, viewControllerFactory: viewControllerFactory)
    }
    
    func makeProfileCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> ProfileCoordinator {
        return ProfileCoordinator(router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
    }

}

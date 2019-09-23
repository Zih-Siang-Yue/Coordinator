//
//  FactoryProtocol.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/17.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func makeAuthCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> AuthCoordinator
    func makeMainCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> MainCoordinator
    func makeOnboardingCoordinatorBox(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) -> OnboardingCoordinator
    func makeChangePwdCoordinatorBox(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) -> ChangePwdCoordinator
    func makeProfileCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> ProfileCoordinator
}


//
//  OnboardingCoordinator.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

final class OnboardingCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    private let router: RouterProtocol
    private let viewControllerFactory: ViewControllerFactory
    
    // MARK: - Private methods
    private func showOnboardingVC() {
        let onboardingVC = self.viewControllerFactory.instantiateOnboardingVC()
        onboardingVC.onFinish = { [unowned self] in
            self.finishFlow?()
        }
        self.router.setRootModule(walktroughVC, hideBar: true)
    }
    
    // MARK: - Coordinator
    override func start() {
        self.showOnboardingVC()
    }
    
    // MARK: - Init
    init(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.viewControllerFactory = viewControllerFactory
    }
}

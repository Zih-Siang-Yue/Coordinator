//
//  ChangePwdCoordinator.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/21.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

class ForgetPwdCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let viewControllerFactory: ViewControllerFactory

    //MARK: - init
    init(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.viewControllerFactory = viewControllerFactory
    }
    
    // MARK: - Coordinator
    override func start() {
        self.showForgetPwdPage()
    }
    
    // MARK: - Private methods
    private func showForgetPwdPage() {
        let vc = self.viewControllerFactory.instantiateForgetPwdVC()
        vc.gotoNextPage = { [unowned self] in
            self.showNewPwdPage()
        }
        self.router.push(vc)
    }
    
    private func showNewPwdPage() {
        let vc = self.viewControllerFactory.instantiateNewPwdVC()
        vc.changePwdAction = { [unowned self] in
            self.finishFlow?()
        }
        self.router.push(vc)
    }
}

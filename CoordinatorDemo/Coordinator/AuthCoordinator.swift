//
//  AuthCoordinator.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

final class AuthCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory

    //MARK: - init
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
    
    override func start() {
        self.showLoginViewController()
    }
    
    // MARK: - Private
    private func showLoginViewController() {
        let loginVC = self.viewControllerFactory.instantiateLoginVC()
        loginVC.loginAction = { [unowned self] in
            self.finishFlow?()
        }
        loginVC.registerAction = { [unowned self] in
            self.showRegisterViewController()
        }
        loginVC.changePwAction = { [unowned self, unowned loginVC] in
            self.showForgetPassword(module: loginVC)
        }
        self.router.setRootModule(loginVC, hideBar: true)
    }
    
    private func showRegisterViewController() {
        let registerVC = self.viewControllerFactory.instantiateRegisterVC()
        registerVC.registerAction = { [unowned self] in
            self.router.popModule()
        }
        registerVC.closeAction = { [unowned self] in
            self.router.dismissModule()
        }
        self.router.present(registerVC, animated: true)//(registerVC)
    }
    
    private func showForgetPassword(module: LoginViewController) {
        let coordinator = self.coordinatorFactory.makeChangePwdCoordinatorBox(router: self.router, viewControllerFactory: self.viewControllerFactory)
        coordinator.finishFlow = { [unowned self, weak module, unowned coordinator] in
            self.removeDependency(coordinator)
            self.router.popToModule(module: module , animated: true)
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
}

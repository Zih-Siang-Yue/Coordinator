//
//  ProfileCoordinator.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

final class ProfileCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
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
    
    // MARK: - Coordinator
    override func start() {
        //
    }
//    private func showForgetPassword(module: ProfileViewController) {
//        let coordinator = self.coordinatorFactory.makeForgetPasswordCoordinatorBox(router: self.router, viewControllerFactory: self.viewControllerFactory)
//        coordinator.finishFlow = { [unowned self, weak module, unowned coordinator] in
//            self.removeDependency(coordinator)
//            self.router.popToModule(module: module , animated: true)
//        }
//        self.addDependency(coordinator)
//        coordinator.start()
//    }
    
}

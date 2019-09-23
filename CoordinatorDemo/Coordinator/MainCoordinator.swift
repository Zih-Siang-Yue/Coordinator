//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

final class MainCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
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
        self.showProductListVC()
    }
    
    // MARK: - Private methods
    private func showProductListVC() {
        let vc = self.viewControllerFactory.instantiateProductListVC()
        vc.gotoDetailPage = { [unowned self] (model: ProductModel) -> Void  in
            self.showProductDetailVC(model: model)
        }
        self.router.setRootModule(vc, hideBar: false)
    }
    
    private func showProductDetailVC(model: ProductModel) {
        let input = ProductDetailInput(productModel: model)
        let vc = self.viewControllerFactory.instantiateProductDetailVC(input: input)
        vc.goBack = { [unowned self] in
            self.router.popModule()
        }
        self.router.push(vc)
    }
    
    private func showProfile() {
        let coordinator = self.coordinatorFactory.makeProfileCoordinatorBox(router: self.router, coordinatorFactory: self.coordinatorFactory, viewControllerFactory: self.viewControllerFactory)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.router.popModule()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
}

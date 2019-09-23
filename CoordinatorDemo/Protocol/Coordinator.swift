//
//  CoordinatorProtocol.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    func start(with option: DeepLinkOption?)
}

protocol CoordinatorFinishOutput {
    var finishFlow: (() -> Void)? { get set }
}

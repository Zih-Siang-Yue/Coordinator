//
//  ViewControllerFactory.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/17.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    func instantiateLoginVC() -> LoginViewController {
        
    }
    
    func instantiateOnboardingVC() -> OnboardingViewController {
        
    }
    
    func instantiateProductListVC() -> ProductListViewController {
        let vm = ProductListViewModel(input: ProductListInput())
        return ProductListViewController(vm: vm)
    }
    
    func instantiateProductDetailVC(input: ProductDetailInput) -> ProductDetailViewController {
        let vm = ProductDetailViewModel(input: input)
        return ProductDetailViewController(vm: vm)
    }
}


//
//  ViewControllerFactory.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/17.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

protocol AuthVCFactoryProtocol {
    func instantiateLoginVC() -> LoginViewController
    func instantiateRegisterVC() -> RegisterViewController
}

protocol OnboardVCFactoryProtocol {
    func instantiateOnboardingVC() -> OnboardingViewController
}

protocol MainVCFactoryProtocol {
    func instantiateProductListVC() -> ProductListViewController
    func instantiateProductDetailVC(input: ProductDetailInput) -> ProductDetailViewController
}

protocol ForgetPwdVCFactoryProtocol {
    func instantiateForgetPwdVC() -> ForgetPwdViewController
    func instantiateNewPwdVC() -> NewPwdViewController
}

class ViewControllerFactory {
    //MARK: - Profile
//    func instantiateProfileVC() -> ProfileViewController {
//
//    }
}

extension ViewControllerFactory: AuthVCFactoryProtocol {
    func instantiateLoginVC() -> LoginViewController {
        let vm = LoginViewModel(input: LoginInput())
        return LoginViewController(vm: vm)
    }
    
    func instantiateRegisterVC() -> RegisterViewController {
        let vm = RegisterViewModel(input: RegisterInput())
        return RegisterViewController(vm: vm)
    }
}

extension ViewControllerFactory: OnboardVCFactoryProtocol {
    func instantiateOnboardingVC() -> OnboardingViewController {
        let vm = OnboardingViewModel()
        return OnboardingViewController(vm: vm)
    }
}

extension ViewControllerFactory: MainVCFactoryProtocol {
    func instantiateProductListVC() -> ProductListViewController {
        let vm = ProductListViewModel(input: ProductListInput())
        return ProductListViewController(vm: vm)
    }
    
    func instantiateProductDetailVC(input: ProductDetailInput) -> ProductDetailViewController {
        let vm = ProductDetailViewModel(input: input)
        return ProductDetailViewController(vm: vm)
    }
}

extension ViewControllerFactory: ForgetPwdVCFactoryProtocol {
    func instantiateForgetPwdVC() -> ForgetPwdViewController {
        let vm = ForgetPwdViewModel()
        return ForgetPwdViewController(vm: vm)
    }
    
    func instantiateNewPwdVC() -> NewPwdViewController {
        let vm = NewPwdViewModel()
        return NewPwdViewController(vm: vm)
    }
}

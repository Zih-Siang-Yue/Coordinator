//
//  ViewControllerFactory.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/17.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    //MARK: - Auth
    func instantiateLoginVC() -> LoginViewController {
        let vm = LoginViewModel(input: LoginInput())
        return LoginViewController(vm: vm)
    }
    
    func instantiateRegisterVC() -> RegisterViewController {
        let vm = RegisterViewModel(input: RegisterInput())
        return RegisterViewController(vm: vm)
    }
    
    //MARK: - Onboard
    func instantiateOnboardingVC() -> OnboardingViewController {
        let vm = OnboardingViewModel()
        return OnboardingViewController(vm: vm)
    }
    
    //MARK: - Main
    func instantiateProductListVC() -> ProductListViewController {
        let vm = ProductListViewModel(input: ProductListInput())
        return ProductListViewController(vm: vm)
    }
    
    func instantiateProductDetailVC(input: ProductDetailInput) -> ProductDetailViewController {
        let vm = ProductDetailViewModel(input: input)
        return ProductDetailViewController(vm: vm)
    }
    
    //MARK: - Forget Pwd
    func instantiateForgetPwdVC() -> ForgetPwdViewController {
        let vm = ForgetPwdViewModel()
        return ForgetPwdViewController(vm: vm)
    }
    
    func instantiateNewPwdVC() -> NewPwdViewController {
        let vm = NewPwdViewModel()
        return NewPwdViewController(vm: vm)
    }
    
    //MARK: - Profile
//    func instantiateProfileVC() -> ProfileViewController {
//
//    }
}


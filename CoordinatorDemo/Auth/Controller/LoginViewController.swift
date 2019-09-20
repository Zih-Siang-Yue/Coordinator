//
//  LoginViewController.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewControllerProtocol {
    
    // MARK: - LoginViewControllerProtocol
    var loginAction: (() -> Void)?
    var registerAction: (() -> Void)?
    var changePwAction: (() -> Void)?
    
    // MARK: - Vars & Lets
    var viewModel: LoginViewModelProtocol?
    
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

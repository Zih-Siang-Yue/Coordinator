//
//  LoginViewController.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

protocol LoginViewControllerProtocol: class {
    var loginAction: (() -> Void)? { get set }
    var registerAction: (() -> Void)? { get set }
    var changePwAction: (() -> Void)? { get set }
}

class LoginViewController: BaseViewController, LoginViewControllerProtocol {
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var forgetPwBtn: UIButton!
    
    // MARK: - LoginViewControllerProtocol
    var loginAction: (() -> Void)?
    var registerAction: (() -> Void)?
    var changePwAction: (() -> Void)?
    
    private var viewModel: LoginViewModel//LoginViewModelProtocol?
    
    //MARK: - init
    init(vm: LoginViewModel) {
        self.viewModel = vm
        super.init(nibName: LoginViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = LoginViewModel(input: LoginInput())
        super.init(coder: aDecoder)
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnConfig()
    }
    
    //MARK: - private func
    private func btnConfig() {
        self.btnUISetting()
        self.btnActionSetting()
    }
    
    private func btnUISetting() {
        self.loginBtn.layer.cornerRadius = 5.0
    }
    
    private func btnActionSetting() {
        self.loginBtn.actionHandle(controlEvents: .touchUpInside) { [unowned self] (_) in
            self.loginAction?()
        }
        
        self.registerBtn.actionHandle(controlEvents: .touchUpInside) { [unowned self] (_) in
            self.registerAction?()
        }
        
        self.forgetPwBtn.actionHandle(controlEvents: .touchUpInside) { [unowned self] (_) in
            self.changePwAction?()
        }
    }
}

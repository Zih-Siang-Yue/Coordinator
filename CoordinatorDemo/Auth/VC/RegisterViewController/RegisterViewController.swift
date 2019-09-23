//
//  RegisterViewController.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

protocol RegisterViewControllerProtocol {
    var registerAction: (() -> Void)? { get set }
    var closeAction: (() -> Void)? { get set }
}

class RegisterViewController: BaseViewController, RegisterViewControllerProtocol {
    
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    
    var registerAction: (() -> Void)?
    var closeAction: (() -> Void)?
    
    private var viewModel: RegisterViewModel//RegisterViewModelProtocol?
    
    //MARK: - init
    init(vm: RegisterViewModel) {
        self.viewModel = vm
        super.init(nibName: RegisterViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = RegisterViewModel(input: RegisterInput())
        super.init(coder: aDecoder)
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnConfig()
    }
    
    private func btnConfig() {
        self.registerBtn.layer.cornerRadius = 5.0
        self.registerBtn.actionHandle(controlEvents: .touchUpInside) { [unowned self] (_) in
            self.registerAction?()
        }
        
        self.closeBtn.actionHandle(controlEvents: .touchUpInside) { [unowned self] (_) in
            self.closeAction?()
        }
    }
}

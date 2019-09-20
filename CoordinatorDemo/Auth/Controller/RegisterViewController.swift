//
//  RegisterViewController.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerAction: (() -> Void)?
    
    // MARK: - Vars & Lets
    var viewModel: RegisterViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//
//  ForgetPwdViewController.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/21.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

protocol ForgetPwdViewControllerProtocol {
    var gotoNextPage: (() -> Void)? { get set }
}

class ForgetPwdViewController: BaseViewController, ForgetPwdViewControllerProtocol {
    
    @IBOutlet weak var nextPageBtn: UIButton!
    
    var gotoNextPage: (() -> Void)?
    
    private var viewModel: ForgetPwdViewModelProtocol?
    
    //MARK: - init
    init(vm: ForgetPwdViewModelProtocol) {
        self.viewModel = vm
        super.init(nibName: ForgetPwdViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = ForgetPwdViewModel()
        super.init(coder: aDecoder)
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnConfig()
    }

    private func btnConfig() {
        self.nextPageBtn.layer.cornerRadius = 5.0
        self.nextPageBtn.actionHandle(controlEvents: .touchUpInside) { [unowned self ] (_) in
            self.gotoNextPage?()
        }
    }
}

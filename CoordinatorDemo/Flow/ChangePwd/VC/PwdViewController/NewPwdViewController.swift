//
//  NewPwdViewController.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/21.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

protocol NewPwdViewControllerProtocol {
    var changePwdAction: (() -> Void)? { get set }
}

class NewPwdViewController: BaseViewController {

    @IBOutlet weak var changePwBtn: UIButton!
    
    var changePwdAction: (() -> Void)?
    
    private var viewModel: NewPwdViewModelProtocol?
    
    //MARK: - init
    init(vm: NewPwdViewModelProtocol) {
        self.viewModel = vm
        super.init(nibName: NewPwdViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = NewPwdViewModel()
        super.init(coder: aDecoder)
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnConfig()
    }
    
    private func btnConfig() {
        self.changePwBtn.layer.cornerRadius = 5.0
        self.changePwBtn.actionHandle(controlEvents: .touchUpInside) { [unowned self] (_) in
            self.changePwdAction?()
        }
    }

}

//
//  OnboardingViewController.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/21.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

protocol OnboardingViewControllerProtocol {
    var skipAction: (() -> Void)? { get set }
}

class OnboardingViewController: BaseViewController, OnboardingViewControllerProtocol {

    @IBOutlet weak var skipBtn: UIButton!
    
    var skipAction: (() -> Void)?
    
    private var viewModel: OnboardingViewModelProtocol?
    
    init(vm: OnboardingViewModelProtocol) {
        self.viewModel = vm
        super.init(nibName: OnboardingViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = OnboardingViewModel()
        super.init(nibName: OnboardingViewController.className, bundle: nil)
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnConfig()
    }

    private func btnConfig() {
        self.skipBtn.layer.cornerRadius = 5.0
        self.skipBtn.actionHandle(controlEvents: .touchUpInside) { [unowned self] (_) in
            self.skipAction?()
        }
    }

}

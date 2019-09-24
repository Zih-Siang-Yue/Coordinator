//
//  ProductDetailViewController.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/19.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

protocol ProductDetailVCProtocol: BaseViewControllerProtocol {
    var logoutAction: (() -> Void)? { get set }
}

class ProductDetailViewController: BaseViewController, ProductDetailVCProtocol {

    //MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    
    //MARK: - public
    public var logoutAction: (() -> Void)?

    //MARK: - private
    private var viewModel: ProductDetailViewModel//ProductDetailViewModelProtocol?
    
    //MARK: - init
    init(vm: ProductDetailViewModel) {
        self.viewModel = vm
        super.init(nibName: ProductDetailViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelConfig()
        self.btnConfig()
    }
    
    private func labelConfig() {
        self.nameLabel.text = self.viewModel.output.titleStr
        self.priceLabel.text = self.viewModel.output.priceStr
        self.descLabel.text = self.viewModel.output.desc
    }
    
    private func btnConfig() {
        self.logoutBtn.layer.cornerRadius = 5.0
        self.logoutBtn.actionHandle(controlEvents: .touchUpInside) { [unowned self] (_) in
            self.logoutAction?()
        }
    }
}

//
//  ProductDetailViewController.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/19.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

protocol ProductDetailVCProtocol: BaseViewControllerProtocol {
    var goBack: (() -> Void)? { get set }
}

class ProductDetailViewController: BaseViewController, ProductDetailVCProtocol {

    //MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var gobackBtn: UIButton!
    
    //MARK: - public
    public var goBack: (() -> Void)?
    
    //MARK: - private
    private var viewModel: ProductDetailViewModelProtocol
    
    //MARK: - init
    init(vm: ProductDetailViewModelProtocol) {
        self.viewModel = vm
        super.init(nibName: "ProductDetailViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiConfig()
        
    }
    
    private func uiConfig() {
        guard let vm = self.viewModel as? ProductDetailViewModel else { return }
        self.nameLabel.text = vm.output.titleStr
        self.priceLabel.text = vm.output.priceStr
        self.descLabel.text = vm.output.desc
    }
    
    private func btnConfig() {
        self.gobackBtn.actionHandle(controlEvents: .touchUpInside) { [unowned self] in
            self.goBack?()
        }
    }
}

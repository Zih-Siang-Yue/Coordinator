//
//  AListViewController.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/19.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

protocol ProductListVCProtocol: BaseViewControllerProtocol {
    var gotoDetailPage: ((ProductModel) -> Void)? { get set }
}

class ProductListViewController: BaseViewController, ProductListVCProtocol {
    
    //MARK - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - public
    var gotoDetailPage: ((ProductModel) -> Void)?
    
    private var viewModel: ProductListViewModelProtocol
    

    //MARK - init
    init(vm: ProductListViewModelProtocol) {
        self.viewModel = vm
        super.init(nibName: "ProductListViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = ProductListViewModel(input: ProductListInput())
        super.init(coder: aDecoder)
    }

    //MARK - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewConfig()
    }
    
    func tableViewConfig() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
    }
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vm = self.viewModel as? ProductListViewModel else { return }
        let model = vm.output.item[indexPath.row]
        if let gotoNextPage = self.gotoDetailPage {
            gotoNextPage(model)
        }
    }
}

extension ProductListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}

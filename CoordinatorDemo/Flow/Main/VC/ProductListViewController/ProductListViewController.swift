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
    
    private var viewModel: ProductListViewModel//ProductListViewModelProtocol?

    //MARK: - init
    init(vm: ProductListViewModel) {
        self.viewModel = vm
        super.init(nibName: ProductListViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = ProductListViewModel(input: ProductListInput())
        super.init(coder: aDecoder)
    }

    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewConfig()
    }
    
    func tableViewConfig() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(cellType: ProductTableViewCell.self)
    }
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.viewModel.output.items[indexPath.row]
        self.gotoDetailPage?(model)
    }
}

extension ProductListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.output.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ProductTableViewCell.self, for: indexPath)
        cell.titleLabel.text = self.viewModel.output.items[indexPath.row].productName
        cell.descLabel.text = self.viewModel.output.items[indexPath.row].productDesc
        cell.priceLabel.text = String(self.viewModel.output.items[indexPath.row].productPrice)
        return cell
    }
    
}

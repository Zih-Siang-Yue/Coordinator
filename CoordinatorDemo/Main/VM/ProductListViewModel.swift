//
//  AListViewModel.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/19.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

protocol ProductListViewModelProtocol: ViewModelType {
    var input: ProductListInput { get set }
    var output: ProductListOutput { get set }
}

struct ProductListInput {
}

struct ProductListOutput {
    var header: String
    var items: [ProductModel]
}

class ProductListViewModel: ProductListViewModelProtocol {

    typealias Input = ProductListInput
    typealias Output = ProductListOutput
    
    var input: Input
    var output: Output
    
    //MARK: - init
    init(input: Input) {
        self.input = input
        //Mock output
        self.output = Output(header: "本季最新產品", items: [
            ProductModel(productId: "1234", productName: "Dyson 吸塵器", productPrice: 16800, productDesc: "專為深層潔淨家居設計，產生強勁吸力的吸塵科技，適用於各種地板", productImgUrl: nil),
            ProductModel(productId: "2345", productName: "小米 掃地機器人", productPrice: 4500, productDesc: "我，米家掃地機器人，智商高，掃得乾淨掃得快", productImgUrl: nil),
            ProductModel(productId: "3456", productName: "Brita 濾水壺", productPrice: 1200, productDesc: "BRITA 濾水壺提供理想機會，讓您最佳化家中水質。", productImgUrl: nil),
            ])
    }
    
    func transform() {
        //Call api...
    }
    
}

//
//  AListViewModel.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/19.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

protocol ProductListViewModelProtocol: ViewModelType {

}

struct ProductListInput {
}

struct ProductListOutput {
    var header: String
    var item: [ProductModel]
}

class ProductListViewModel: ProductListViewModelProtocol {
    
    typealias Input = ProductListInput
    typealias Output = ProductListOutput
    
    //MARK: - public
    private var input: Input
    public let output: Output
    
    //MARK: - init
    init(input: Input) {
        self.input = input
        //Mock output
        self.output = Output(header: "本季最新產品", item: [
            ProductModel(productId: "1234", productName: "Dyson 吸塵器", productPrice: 168, productDesc: "專為深層潔淨家居設計，產生強勁吸力的吸塵科技，適用於各種地板", productImgUrl: nil),
            ProductModel(productId: "2345", productName: "小米 掃地機器人", productPrice: 666, productDesc: "我，米家掃地機器人，智商高，掃得乾淨掃得快", productImgUrl: nil),
            ProductModel(productId: "3456", productName: "Dyson 吸塵器", productPrice: 888, productDesc: "", productImgUrl: nil),
            ])
    }
    
    func transform() {
        //Call api...
    }
    
}

//
//  ProductDetailViewModel.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/19.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

protocol ProductDetailViewModelProtocol: ViewModelType {
    var input: ProductDetailInput { get set }
    var output: ProductDetailOutput { get set }
    func transform()
}

struct ProductDetailInput {
    let productModel: ProductModel
}

struct ProductDetailOutput {
    let titleStr: String
    let priceStr: String
    let desc: String?
}

class ProductDetailViewModel: ProductDetailViewModelProtocol {
    
    typealias Input = ProductDetailInput
    typealias Output = ProductDetailOutput
    
    //MARK: - public
    var input: Input
    var output: Output
    
    init(input: Input) {
        self.input = input
        self.output = Output(titleStr: input.productModel.productName,
                             priceStr: String(input.productModel.productPrice),
                             desc: input.productModel.productDesc)
    }
    
    func transform() {
        //...
    }
    
}

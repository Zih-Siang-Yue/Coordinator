//
//  LoginViewModel.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/20.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol: ViewModelType {
    var input: LoginInput { get set }
    var output: LoginOutput { get set }
}

struct LoginInput {
    
}

struct LoginOutput {
    
}

class LoginViewModel: LoginViewModelProtocol {
    
    typealias Input = LoginInput
    typealias Output = LoginOutput
    
    //MARK: - public
    var input: Input
    var output: Output
    
    init(input: Input) {
        self.input = input
        self.output = Output()
    }
}

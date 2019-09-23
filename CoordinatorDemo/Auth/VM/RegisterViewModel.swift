//
//  RegisterViewModel.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/21.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

protocol RegisterViewModelProtocol: ViewModelType {
    var input: RegisterInput { get set }
    var output: RegisterOutput { get set }
}

struct RegisterInput {
    
}

struct RegisterOutput {
    
}

class RegisterViewModel: RegisterViewModelProtocol {
    
    typealias Input = RegisterInput
    typealias Output = RegisterOutput
    
    //MARK: - public
    var input: Input
    var output: Output

    init(input: Input) {
        self.input = input
        self.output = Output()
    }
}

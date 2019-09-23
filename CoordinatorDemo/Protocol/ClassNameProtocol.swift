//
//  ClassNameProtocol.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/21.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

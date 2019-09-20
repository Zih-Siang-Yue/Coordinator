//
//  UserDefault+subscript.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

struct PreferenceName<T>: RawRepresentable {
    typealias RawValue = String
    
    var rawValue: String
    
    init(rawValue: PreferenceName.RawValue) {
        self.rawValue = rawValue
    }
}

struct PreferenceConfigs {
    static let userToken = PreferenceName<String>(rawValue: "UserToken")
    static let isFirstTimeToLogin = PreferenceName<Bool>(rawValue: "IsFirstTimeToLogin")
    static let backgroundImageURL = PreferenceName<URL>(rawValue: "BackgroundImageURL")
}

extension UserDefaults {
    subscript(key: PreferenceName<Bool>) -> Bool {
        set { set(newValue, forKey: key.rawValue) }
        get { return bool(forKey: key.rawValue) }
    }
    
    subscript(key: PreferenceName<Int>) -> Int {
        set { set(newValue, forKey: key.rawValue) }
        get { return integer(forKey: key.rawValue) }
    }
    
    subscript(key: PreferenceName<Any>) -> Any {
        set { set(newValue, forKey: key.rawValue) }
        get { return value(forKey: key.rawValue) }
    }
}

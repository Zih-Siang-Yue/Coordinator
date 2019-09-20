//
//  LaunchInstructor.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/18.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import Foundation

fileprivate var onboardingWasShown = false
fileprivate var isAutorized = false

enum LaunchInstructor {
    
    case main
    case auth
    case onboarding
    
    // MARK: - Public
    static func configure(tutorialWasShown: Bool = onboardingWasShown, isAutorized: Bool = isAutorized) -> LaunchInstructor {
        let tuple = (tutorialWasShown, isAutorized)
        switch tuple {
        case (true, false), (false, false): return .auth
        case (false, true): return .onboarding
        case (true, true): return .main
        }
    }
}

//fileprivate enum LaunchInstructor: String {
//    case auth = "auth"
//    case main = "main"
//    case guidance = "guidance"
//    case onboarding = "onboarding"
//    
//    
//    static func configure() -> LaunchInstructor {
//        let isFirstTime = UserDefaults.standard[PreferenceConfigs.isFirstTimeToLogin]
//        let token = UserDefaults.standard[PreferenceConfigs.userToken]
//        
//        if isFirstTime && token != nil {
//            return .guidance
//        }
//        else if token != nil {
//            return .main
//        }
//        else {
//            return .auth
//        }
//    }
//}

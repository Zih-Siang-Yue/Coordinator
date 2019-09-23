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

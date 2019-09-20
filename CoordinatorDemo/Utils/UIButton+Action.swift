//
//  UIButton+Action.swift
//  CoordinatorDemo
//
//  Created by Sean.Yue on 2019/9/20.
//  Copyright © 2019 Sean.Yue. All rights reserved.
//

import UIKit

extension UIButton {
    struct Temp {
        static var action :(() -> Void)?
    }
    
    private func actionHandler(action: (() -> Void)? = nil) {
        if action != nil { Temp.action = action }
        else { Temp.action?() }
    }
    
    @objc private func triggerActionHandler() {
        self.actionHandler()
    }
    
    func actionHandle(controlEvents control :UIControl.Event, ForAction action:@escaping () -> Void) {
        self.actionHandler(action: action)
        self.addTarget(self, action: #selector(triggerActionHandler), for: control)
    }
}

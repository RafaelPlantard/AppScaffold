//
//  main.swift
//  AppScaffold
//
//  Created by Rafael Ferreira on 12/15/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

import func Foundation.NSStringFromClass
import func UIKit.UIApplicationMain

let appDelegateClass = NSStringFromClass(AppDelegate.self)

_ = UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, appDelegateClass)

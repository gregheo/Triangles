//
//  AppDelegate.swift
//  UITriangle
//
//  Copyright © 2017 Greg Heo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    window?.backgroundColor = .white
    window?.rootViewController = ViewController(nibName: nil, bundle: nil)
    window?.makeKeyAndVisible()

    return true
  }
}


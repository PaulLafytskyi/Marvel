//
//  AppDelegate.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/18/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import UIKit
import Reachability
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = FeedSceneFactory.defaultFeedScene()
        return true
    }
}


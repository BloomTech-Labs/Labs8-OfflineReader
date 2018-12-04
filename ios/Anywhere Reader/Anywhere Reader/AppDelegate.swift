//
//  AppDelegate.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import Stripe
import FacebookCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        STPPaymentConfiguration.shared().publishableKey = "pk_test_2rPuyENL1sfpQAu8wCPX6Fx5"
        
        AppearanceHelper.setUpTheme()
        
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateInitialViewController()
//        self.window?.rootViewController = vc
//        self.window?.makeKeyAndVisible()

        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return SDKApplicationDelegate.shared.application(app, open: url, options: options)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Calls the 'activate' method to log an app event for use in analytics and advertising reporting.
        AppEventsLogger.activate(application)
    }
}


//
//  AppDelegate.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GIDSignIn.sharedInstance().clientID = "308606958601-9u35afi45dgjqdljqu43ldqa8012nj0d.apps.googleusercontent.com"
        
        AppearanceHelper.setUpTheme()
        
        if let isSignedIn = GIDSignIn.sharedInstance()?.hasAuthInKeychain() {
            if isSignedIn {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateInitialViewController()
                self.window?.rootViewController = vc
                self.window?.makeKeyAndVisible()
            }
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url as URL?,
                                                  sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                                  annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }
}


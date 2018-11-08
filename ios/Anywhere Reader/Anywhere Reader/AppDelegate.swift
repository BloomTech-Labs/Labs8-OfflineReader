//
//  AppDelegate.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        if Auth.auth().currentUser == nil {
            let storyboard = UIStoryboard(name: "Authentication", bundle: Bundle.main)
            let authorizationViewController = storyboard.instantiateViewController(withIdentifier: "AuthenticationViewController")
            window?.makeKeyAndVisible()
            window?.rootViewController?.present(authorizationViewController, animated: true, completion: nil)
        }
        
        return true
    }
}


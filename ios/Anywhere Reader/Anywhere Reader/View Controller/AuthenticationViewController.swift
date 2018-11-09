//
//  AuthenticationViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - IBActions
    @IBAction func logInButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        // Pass information to AuthService.instance.loginUser
        
        AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, loginError) in
            if let loginError = loginError {
                NSLog("Error logging in with user at email: \(email). Error: \(loginError)")
                return
            }
            print(self.view.window!.rootViewController)
            self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        }
    }
}

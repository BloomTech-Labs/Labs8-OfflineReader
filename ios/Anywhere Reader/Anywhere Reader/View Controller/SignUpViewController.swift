//
//  SignUpViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/8/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    override func viewDidLoad() {
        passwordTextField.textContentType = .init(rawValue: "")
    }
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        // Pass information to AuthService.instance.registerUser
        // Register user and if successful, log them in
        AuthService.instance.registerUser(withEmail: email, andPassword: password) { (success, registrationError) in
            if let registrationError = registrationError {
                NSLog("Error registering user with email: \(email). Error: \(registrationError)")
                return
            }
            
            AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, loginError) in
                if let loginError = loginError {
                    NSLog("Error logging in with user at email: \(email). Error: \(loginError)")
                    return
                }
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

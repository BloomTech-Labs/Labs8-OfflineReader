//
//  AuthenticationViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBOutlets
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    
    // MARK: - IBActions
    @IBAction func logInButtonTapped(_ sender: Any) {
        // Pass information to AuthService.instance.loginUser
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        // Pass information to AuthService.instance.registerUser
    }
}

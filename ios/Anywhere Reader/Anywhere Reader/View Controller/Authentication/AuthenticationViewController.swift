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
        
        credentialsView.layer.cornerRadius = 5.0
        
    }
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var credentialsView: UIView!
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet weak var usernameView: GradientMaskView!
    @IBOutlet weak var emailView: GradientMaskView!
    @IBOutlet weak var passwordView: GradientMaskView!
    
    
    // MARK: - IBActions
    
    
    
    
    // MARK: - Private functions
    
    
}

//
//  AuthenticationViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import FacebookLogin

class AuthenticationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginButton = LoginButton(readPermissions: [.publicProfile])
        stackView.addArrangedSubview(loginButton)
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var stackView: UIStackView!
}

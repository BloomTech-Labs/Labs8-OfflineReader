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
        
        // Makes sure the background is a solid color even if it happens to get layed out on top of the trapezoid gradient
        credentialsView.layer.cornerRadius = 5.0
        credentialsView.layer.shadowColor = UIColor.white.cgColor
        credentialsView.layer.shadowRadius = 10.0
        credentialsView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        credentialsView.layer.shadowOpacity = 1.0
        
        // Adds gradient to button
        authenticateButton.addGradient(primaryColor: .red, secondaryColor: .orange, startPoint: CGPoint(x: 0.0, y: 0.0), endPoint: CGPoint(x: 1.0, y: 0.0))
        authenticateButton.layer.cornerRadius = authenticateButton.frame.height / 2
        authenticateButton.setTitleColor(.white, for: .normal)
        authenticateButton.clipsToBounds = true
        authenticateButton.contentMode = .redraw
        
        // Sets up segmented control
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 12.0)!], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 20.0)!], for: .selected)
    }
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var credentialsView: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet weak var usernameView: GradientMaskView!
    @IBOutlet weak var emailView: GradientMaskView!
    @IBOutlet weak var passwordView: GradientMaskView!
    
    @IBOutlet weak var authenticateButton: UIButton!
    
    
    // MARK: - IBActions
    
    
    
    
    // MARK: - Private functions
    
    
}

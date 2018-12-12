//
//  SegmentedSettingsViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/7/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import FacebookLogin

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logOutButton.layer.cornerRadius = 4.0
    }
    
    
    // MARK: - Properties
    
    private let apiService = APIService.shared
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var logOutButton: UIButton!
    
    
    // MARK: - Actions

    @IBAction func dismissSettingsVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logOut(_ sender: Any) {
        let alertController = UIAlertController(title: "Are you sure you want to sign out?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive) { _ in
            // Logs user out using FacebookLogin SDK
            LoginManager().logOut()
            self.apiService.signOut() { (result, error) in
                if let error = error {
                    NSLog("Error signing out from server: \(error)")
                    return
                }
                if result == .success {
                    NSLog("The sign out was successful")
                }
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(signOutAction)
        present(alertController, animated: true)
    }
}

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
        NotificationCenter.default.addObserver(self, selector: #selector(updateTheme), name: UserDefaults.didChangeNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateTheme()
    }
    
    // MARK: - Properties
    
    private let themeHelper = ThemeHelper.shared
    override var preferredStatusBarStyle : UIStatusBarStyle {
        if themeHelper.isNightMode || themeHelper.getLastStoredTheme() == .lightGray {
            return .lightContent
        } else {
            return .default
        }
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var subscriptionChoiceView: UIView!
    @IBOutlet weak var goPremiumLabel: UILabel!
    @IBOutlet weak var premiumDescriptionLabel: UILabel!
    
    
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
        }
        alertController.addAction(cancelAction)
        alertController.addAction(signOutAction)
        present(alertController, animated: true)
    }
    
    @IBAction func presentPreferences(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Preferences", bundle: nil)
        guard let preferencesVC = storyboard.instantiateInitialViewController() else { return }
        preferencesVC.providesPresentationContextTransitionStyle = true
        preferencesVC.definesPresentationContext = true
        preferencesVC.modalPresentationStyle = .overCurrentContext
        preferencesVC.modalTransitionStyle = .crossDissolve
        
        self.present(preferencesVC, animated: true, completion: nil)
    }
    
    // MARK: - Private Functions
    
    @objc private func updateTheme() {
        // Backgrounds
        let backgroundColor = themeHelper.getBackgroundColor()
        view.backgroundColor = backgroundColor
        subscriptionChoiceView.backgroundColor = backgroundColor
        navigationController?.navigationBar.barTintColor = backgroundColor

        // Text
        let textColor = themeHelper.getTextColor()
        navigationController?.navigationBar.tintColor = textColor
        goPremiumLabel.textColor = textColor
        premiumDescriptionLabel.textColor = textColor
    }
}

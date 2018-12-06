//
//  SegmentedSettingsViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/7/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import FacebookLogin

class SegmentedSettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    // MARK: - Private Properties
    
    private lazy var accountViewController: AccountViewController = {
        let storyboard = UIStoryboard(name: "Settings", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        self.add(childViewController: viewController)
        return viewController
    }()

    private lazy var billingViewController: BillingViewController = {
        let storyboard = UIStoryboard(name: "Settings", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "BillingViewController") as! BillingViewController
        self.add(childViewController: viewController)
        return viewController
    }()

    
    // MARK: - IBOutlets
    
    @IBOutlet var settingsTitle: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var containerView: UIView!

    
    // MARK: - IBActions
    
    @IBAction func segmentedControlTapped(_ sender: Any) {
        updateViews()
    }
    
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
}


// MARK: - Private methods

extension SegmentedSettingsViewController {
    private func updateViews() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(childViewController: billingViewController)
            add(childViewController: accountViewController)
            settingsTitle.text = segmentedControl.titleForSegment(at: 0)
        } else {
            remove(childViewController: accountViewController)
            add(childViewController: billingViewController)
            settingsTitle.text = segmentedControl.titleForSegment(at: 1)
        }
    }

    private func add(childViewController viewController: UIViewController) {
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }

    private func remove(childViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

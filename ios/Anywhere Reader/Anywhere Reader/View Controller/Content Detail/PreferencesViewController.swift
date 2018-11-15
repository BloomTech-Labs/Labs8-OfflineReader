//
//  PreferencesViewController.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/8/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class PreferencesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferencesView.layer.cornerRadius = 20
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        deanimateView()
        // If you click on another tab without the line below, the view doesn't get dismissed
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Private properties
    private let themeHelper = UserDefaultsThemeHelper.shared
    
    
    // MARK: - Outlets
    @IBOutlet weak var preferencesView: UIView!
    
    
    // MARK: - Actions
    @IBAction private func dismissFromTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        // Makes sure the location of tap was outside the bounds of the preferencesView so it can dismiss the VC
        if !preferencesView.frame.contains(location) {
            dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func increaseFontSize(_ sender: Any) {
        let oldSize = themeHelper.getFont().pointSize
        // Increases font size by 1 cgpoint. Increment size can be changed later.
        themeHelper.setFont(name: nil, size: oldSize + 1)
    }
    @IBAction func decreaseFontSize(_ sender: Any) {
        let oldSize = themeHelper.getFont().pointSize
        // Decreases font size by 1 cgpoint. Increment size can be changed later.
        themeHelper.setFont(name: nil, size: oldSize - 1)
    }
    @IBAction func changeFontColor(_ sender: Any) {
        // Unhides a not yet made font color view
    }
    @IBAction func changeBackgroundColor(_ sender: Any) {
        // Unhides a not yet made background color view
    }
    @IBAction func changeFont(_ sender: Any) {
        // Unhides a not yet made font choice view
    }
    
    
    // MARK: - Private functions
    private func animateView() {
        // Makes sure the main view starts out see through and 50 cgpoints below its normal frame
        preferencesView.alpha = 0;
        self.preferencesView.frame.origin.y = self.preferencesView.frame.origin.y + 50
        // Start of animation
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            // Makes main view end completely visible and at its normal frame (50 cgpoints above start) by the end of the animation
            self.preferencesView.alpha = 1.0
            self.preferencesView.frame.origin.y = self.preferencesView.frame.origin.y - 50
        })
    }
    private func deanimateView() {
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            // Opposite of animate view: makes main view fade out and move 50 cgpoints below
            self.preferencesView.alpha = 0
            self.preferencesView.frame.origin.y = self.preferencesView.frame.origin.y + 50
        })
    }
}

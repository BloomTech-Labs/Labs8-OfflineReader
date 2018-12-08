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
        updateButtonsView()
        preferencesView.layer.cornerRadius = 12.0
        preferencesView.layer.shadowColor = UIColor.darkGray.cgColor
        preferencesView.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        preferencesView.layer.shadowOpacity = 0.25
        preferencesView.layer.shadowRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if themeHelper.isNightMode {
            nightThemeSwitch.isOn = true
        }
        brightnessSlider.value = Float(UIScreen.main.brightness)
        animateView()
    }
    
    
    // MARK: - Private properties
    
    private let themeHelper = ThemeHelper.shared
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var preferencesView: UIView!
    @IBOutlet weak var whiteThemeButton: UIButton!
    @IBOutlet weak var tanThemeButton: UIButton!
    @IBOutlet weak var lightGrayThemeButton: UIButton!
    @IBOutlet weak var darkGrayThemeButton: UIButton!
    @IBOutlet weak var nightThemeSwitch: UISwitch!
    @IBOutlet weak var brightnessSlider: UISlider!
    
    
    // MARK: - Actions
    
    @IBAction private func dismissFromTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        // Makes sure the location of tap was outside the bounds of the preferencesView so it can dismiss the VC
        if !preferencesView.frame.contains(location) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func increaseFontSize(_ sender: Any) {
        let oldSize = themeHelper.getBodyFont().pointSize
        // Increases font size by 1 cgpoint. Increment size can be changed later.
        themeHelper.setBodyFont(name: nil, size: oldSize + 1)
    }
    
    @IBAction func decreaseFontSize(_ sender: Any) {
        let oldSize = themeHelper.getBodyFont().pointSize
        // Decreases font size by 1 cgpoint. Increment size can be changed later.
        themeHelper.setBodyFont(name: nil, size: oldSize - 1)
    }
    
    @IBAction func whiteThemeButtonTapped(_ sender: Any) {
        themeHelper.setWhiteTheme()
        nightThemeSwitch.isOn = false
    }
    
    @IBAction func tanThemeButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
        nightThemeSwitch.isOn = false
    }
    
    @IBAction func lightGrayThemeButtonTapped(_ sender: Any) {
        themeHelper.setLightGrayTheme()
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
        nightThemeSwitch.isOn = false
    }
    
    @IBAction func darkGrayThemeButtonTapped(_ sender: Any) {
        themeHelper.setDarkGrayTheme()
    }
    
    @IBAction func nightModeSwitch(_ sender: Any) {
        if nightThemeSwitch.isOn {
            themeHelper.toggleNightMode()
            themeHelper.setDarkGrayTheme()
        } else {
            themeHelper.toggleNightMode()
            whiteThemeButtonTapped(sender)
        }
    }
    
    @IBAction func changeFont(_ sender: Any) {
        // Unhides a not yet made font choice view
    }
    
    @IBAction func brightnessSliderChanged(_ sender: Any) {
        UIScreen.main.brightness = CGFloat(brightnessSlider.value)
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
    
    private func updateButtonsView() {
        let buttons = [whiteThemeButton,
                       tanThemeButton,
                       lightGrayThemeButton,
                       darkGrayThemeButton]
        
        buttons.forEach { button in
            if let button = button {
                button.layer.cornerRadius = 0.5 * button.bounds.size.width
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
    }
}

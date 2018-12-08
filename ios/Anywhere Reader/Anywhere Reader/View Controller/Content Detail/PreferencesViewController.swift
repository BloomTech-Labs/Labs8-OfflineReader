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
        
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if themeHelper.isNightMode {
            nightThemeSwitch.isOn = true
        }
        brightnessSlider.value = Float(UIScreen.main.brightness)
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
    
    /**
     Dismisses current instance of PreferencesViewController
     
     IBAction for a UITapGestureRecognizer that checks to see if the location of the tap was outside the main view. If it was, the current instace of the view controller is dismissed.
     
     - Author: Samantha Gatt
     */
    @IBAction private func dismissFromTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        // Makes sure the location of tap was outside the bounds of the preferencesView so it can dismiss the VC
        if !preferencesView.frame.contains(location) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    /**
     Increases current font size by one point
     
     - Author: Samantha Gatt
     */
    @IBAction private func increaseFontSize(_ sender: Any) {
        let oldSize = themeHelper.getBodyFont().pointSize
        // Increases font size by 1 cgpoint. Increment size can be changed later.
        themeHelper.setBodyFont(name: nil, size: oldSize + 1)
    }
    
    /**
     Decreases current font size by one point
     
     - Author: Samantha Gatt
     */
    @IBAction private func decreaseFontSize(_ sender: Any) {
        let oldSize = themeHelper.getBodyFont().pointSize
        // Decreases font size by 1 cgpoint. Increment size can be changed later.
        themeHelper.setBodyFont(name: nil, size: oldSize - 1)
    }
    
    /**
     Sets current theme to white
     
     - Author: Conner Alegre
     */
    @IBAction private func whiteThemeButtonTapped(_ sender: Any) {
        themeHelper.setWhiteTheme()
        nightThemeSwitch.setOn(false, animated: true)
    }
    
    /**
     Sets current theme to tan
     
     - Author: Conner Alegre
     */
    @IBAction private func tanThemeButtonTapped(_ sender: Any) {
        themeHelper.setTanTheme()
        nightThemeSwitch.setOn(false, animated: true)
    }
    
    /**
     Sets current theme to light gray
     
     - Author: Conner Alegre
     */
    @IBAction private func lightGrayThemeButtonTapped(_ sender: Any) {
        themeHelper.setLightGrayTheme()
        nightThemeSwitch.setOn(false, animated: true)
    }
    
    /**
     Sets current theme to dark gray
     
     - Author: Conner Alegre
     */
    @IBAction private func darkGrayThemeButtonTapped(_ sender: Any) {
        themeHelper.setDarkGrayTheme()
        nightThemeSwitch.setOn(true, animated: true)
    }
    
    /**
     Toggles night mode theme
     
     - Author: Conner Alegre
     */
    @IBAction private func nightModeSwitch(_ sender: Any) {
        themeHelper.toggleNightMode()
    }
    
    @IBAction private func changeFont(_ sender: Any) {
        // Unhides a not yet made font choice view
    }
    
    /**
     Changes the brightness of the main UIScreen
     
     - Author: Conner Alegre
     */
    @IBAction private func brightnessSliderChanged(_ sender: Any) {
        UIScreen.main.brightness = CGFloat(brightnessSlider.value)
    }
    
    
    // MARK: - Private functions
    
    /// Sets all UI not easily manipulated in Interface Builder
    private func updateViews() {
        updateMainView()
        updateButtonsView()
    }
    
    /**
     Configures the main view's corner radius and shadow layer
     
     - Author: Samantha Gatt
     */
    private func updateMainView() {
        preferencesView.layer.cornerRadius = 12.0
        preferencesView.layer.shadowColor = UIColor.darkGray.cgColor
        preferencesView.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        preferencesView.layer.shadowOpacity = 0.25
        preferencesView.layer.shadowRadius = 5
    }
    
    /**
     Configures each theme button's UI
     
     - Author: Conner Alegre
     */
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

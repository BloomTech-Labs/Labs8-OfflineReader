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
        
        preferencesView.layer.cornerRadius = 12.0
        preferencesView.layer.shadowColor = UIColor.darkGray.cgColor
        preferencesView.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        preferencesView.layer.shadowOpacity = 0.25
        preferencesView.layer.shadowRadius = 5
        
        let textProvidedColor = self.themeHelper.getTextProvidedColor()
        let textColorRow = UserDefaultsThemeHelper.providedColors.firstIndex(of: textProvidedColor) ?? 0
        self.textColorTableView.selectRow(at: IndexPath(row: textColorRow, section: 0), animated: false, scrollPosition: .none)
        
        let backgroundProvidedColor = self.themeHelper.getBackgroundProvidedColor()
        let backgroundColorRow = UserDefaultsThemeHelper.providedColors.firstIndex(of: backgroundProvidedColor) ?? 0
        self.backgroundColorTableView.selectRow(at: IndexPath(row: backgroundColorRow, section: 0), animated: false, scrollPosition: .none)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateView()
    }
    
    
    // MARK: - Private properties
    
    private let themeHelper = UserDefaultsThemeHelper.shared
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var preferencesView: UIView!
    @IBOutlet weak var textColorTableView: UITableView!
    @IBOutlet weak var backgroundColorTableView: UITableView!
    
    @IBOutlet weak var textColorTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundColorTableViewHeightConstraint: NSLayoutConstraint!
    
    
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
    
    @IBAction func toggleFontColorTableView(_ sender: Any) {
        // Unhides font color table view
        let heightConstant = textColorTableViewHeightConstraint.constant
        if heightConstant == 0 {
            textColorTableViewHeightConstraint.constant = 180
            textColorTableView.isHidden = false
        } else {
            textColorTableViewHeightConstraint.constant = 0
        }
        if backgroundColorTableViewHeightConstraint.constant != 0 {
            backgroundColorTableViewHeightConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            if self.textColorTableViewHeightConstraint.constant == 0 {
                self.textColorTableView.isHidden = true
            }
            self.backgroundColorTableView.isHidden = true
        }
    }
    
    @IBAction func toggleBackgroundColorTableView(_ sender: Any) {
        // Unhides background color table view
        let heightConstant = backgroundColorTableViewHeightConstraint.constant
        if heightConstant == 0 {
            backgroundColorTableViewHeightConstraint.constant = 180
            backgroundColorTableView.isHidden = false
        } else {
            backgroundColorTableViewHeightConstraint.constant = 0
        }
        
        if textColorTableViewHeightConstraint.constant != 0 {
            textColorTableViewHeightConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            if self.backgroundColorTableViewHeightConstraint.constant == 0 {
                self.backgroundColorTableView.isHidden = true
            }
            self.textColorTableView.isHidden = true
        }
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


// MARK: - UITableViewDelegate and DataSource

extension PreferencesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDefaultsThemeHelper.providedColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        cell.textLabel?.text = UserDefaultsThemeHelper.providedColors[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case textColorTableView:
            let providedColor = UserDefaultsThemeHelper.providedColors[indexPath.row]
            themeHelper.setTextColor(providedColor: providedColor)
            textColorTableView.scrollToNearestSelectedRow(at: .middle, animated: true)
        case backgroundColorTableView:
            let providedColor = UserDefaultsThemeHelper.providedColors[indexPath.row]
            themeHelper.setBackgroundColor(providedColor: providedColor)
            backgroundColorTableView.scrollToNearestSelectedRow(at: .middle, animated: true)
        default:
            fatalError()
        }
        
    }
}

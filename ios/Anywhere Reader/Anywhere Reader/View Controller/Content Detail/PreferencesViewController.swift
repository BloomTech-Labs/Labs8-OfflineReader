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
        
        let textProvidedColor = themeHelper.getTextProvidedColor()
        let textColorRow = UserDefaultsThemeHelper.providedColors.firstIndex(of: textProvidedColor) ?? 0
        textColorTableView.selectRow(at: IndexPath(row: textColorRow, section: 0), animated: false, scrollPosition: .middle)
        
        let backgroundProvidedColor = themeHelper.getBackgroundProvidedColor()
        let backgroundColorRow = UserDefaultsThemeHelper.providedColors.firstIndex(of: backgroundProvidedColor) ?? 1
        backgroundColorTableView.selectRow(at: IndexPath(row: backgroundColorRow, section: 0), animated: false, scrollPosition: .middle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateView()
    }
    
    // TODO: Probably not needed anymore
    override func viewWillDisappear(_ animated: Bool) {
        deanimateView()
        // NOT USING TAB BAR ANYMORE...
        // If you click on another tab without the line below, the view doesn't get dismissed
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Private properties
    
    private let themeHelper = UserDefaultsThemeHelper.shared
    
    private var textColorIsHidden = true {
        didSet {
            if oldValue != textColorIsHidden {
                animateDetailViews()
            }
        }
    }
    private var backgroundColorIsHidden = true {
        didSet {
            if oldValue != backgroundColorIsHidden {
                animateDetailViews()
            }
        }
    }
    private var fontIsHidden = true {
        didSet {
            if oldValue != fontIsHidden {
                animateDetailViews()
            }
        }
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var preferencesView: UIView!
    @IBOutlet weak var detailStackView: UIStackView!
    @IBOutlet weak var textColorTableView: UITableView!
    @IBOutlet weak var backgroundColorTableView: UITableView!
    @IBOutlet weak var fontTableView: UITableView!
    
    @IBOutlet weak var detailStackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var textColorWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundColorWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var fontWidthConstraint: NSLayoutConstraint!
    
    
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
    
    @IBAction func toggleTextColorTableView(_ sender: Any) {
        
        if textColorIsHidden {
            textColorIsHidden = false
            backgroundColorIsHidden = true
            fontIsHidden = true
        } else {
            textColorIsHidden = true
        }
        
        // Unhides font color table view
//        let heightConstant = textColorTableViewHeightConstraint.constant
//        if heightConstant == 0 {
//            textColorTableViewHeightConstraint.constant = 180
//            textColorTableView.isHidden = false
//        } else {
//            textColorTableViewHeightConstraint.constant = 0
//        }
//        if backgroundColorTableViewHeightConstraint.constant != 0 {
//            backgroundColorTableViewHeightConstraint.constant = 0
//        }
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.layoutIfNeeded()
//        }) { _ in
//            if self.textColorTableViewHeightConstraint.constant == 0 {
//                self.textColorTableView.isHidden = true
//            }
//            self.backgroundColorTableView.isHidden = true
//        }
    }
    
    @IBAction func toggleBackgroundColorTableView(_ sender: Any) {
        
        if backgroundColorIsHidden {
            backgroundColorIsHidden = false
            textColorIsHidden = true
            fontIsHidden = true
        } else {
            backgroundColorIsHidden = true
        }
        
        // Unhides background color table view
//        let heightConstant = backgroundColorTableViewHeightConstraint.constant
//        if heightConstant == 0 {
//            backgroundColorTableViewHeightConstraint.constant = 180
//            backgroundColorTableView.isHidden = false
//        } else {
//            backgroundColorTableViewHeightConstraint.constant = 0
//        }
//        
//        if textColorTableViewHeightConstraint.constant != 0 {
//            textColorTableViewHeightConstraint.constant = 0
//        }
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.layoutIfNeeded()
//        }) { _ in
//            if self.backgroundColorTableViewHeightConstraint.constant == 0 {
//                self.backgroundColorTableView.isHidden = true
//            }
//            self.textColorTableView.isHidden = true
//        }
    }
    
    @IBAction func toggleFontTableView(_ sender: Any) {
        // Unhides font choice textField
        if fontIsHidden {
            fontIsHidden = false
            backgroundColorIsHidden = true
            textColorIsHidden = true
        } else {
            fontIsHidden = true
        }
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
    
    
    
    private func animateDetailViews() {
        
        var shouldHideStackView: Bool
        
        // If any of the detail views has been unhidden
        if !textColorIsHidden || !backgroundColorIsHidden || !fontIsHidden {
            // Unhide the detailStackView
            shouldHideStackView = false
        // If none of them are unhidden
        } else {
            // Hide the stack view
            shouldHideStackView = true
        }
        
        // If the stack view should be hidden
        if shouldHideStackView {
            detailStackViewHeightConstraint.constant = 0
            textColorWidthConstraint.constant = 0
            backgroundColorWidthConstraint.constant = 0
            fontWidthConstraint.constant = 0
        // If the stack view should be visible
        } else {
            detailStackViewHeightConstraint.constant = 180
            
            if !textColorIsHidden {
                backgroundColorWidthConstraint.constant = 0
                fontWidthConstraint.constant = 0
                textColorWidthConstraint.constant = 310
            } else if !backgroundColorIsHidden {
                textColorWidthConstraint.constant = 0
                fontWidthConstraint.constant = 0
                backgroundColorWidthConstraint.constant = 310
            } else if !fontIsHidden {
                textColorWidthConstraint.constant = 0
                backgroundColorWidthConstraint.constant = 0
                fontWidthConstraint.constant = 310
            }
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutSubviews()
        }) { _ in
            self.detailStackView.isHidden = shouldHideStackView
            self.textColorTableView.isHidden = self.textColorIsHidden
            self.backgroundColorTableView.isHidden = self.backgroundColorIsHidden
            self.fontTableView.isHidden = self.fontIsHidden
        }
    }
    
    
    
    
    
}


// MARK: - UITableViewDelegate and DataSource

extension PreferencesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == fontTableView {
            return UserDefaultsThemeHelper.fontNames.count
        } else {
            return UserDefaultsThemeHelper.providedColors.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == fontTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
            cell.textLabel?.text = UserDefaultsThemeHelper.fontNames[indexPath.row].rawValue
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
            cell.textLabel?.text = UserDefaultsThemeHelper.providedColors[indexPath.row].rawValue
            return cell}
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
        case fontTableView:
            return
        default:
            fatalError()
        }
        
    }
}

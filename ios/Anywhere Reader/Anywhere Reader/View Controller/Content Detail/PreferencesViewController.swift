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
        
        textColorTableView.dataSource = self
        textColorTableView.delegate = self
        
        let textProvidedColor = themeHelper.getTextProvidedColor()
        let row = UserDefaultsThemeHelper.providedColors.firstIndex(of: textProvidedColor) ?? 0
        textColorTableView.selectRow(at: IndexPath(row: row, section: 0), animated: true, scrollPosition: .middle)
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
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var preferencesView: UIView!
    @IBOutlet weak var textColorTableView: UITableView!
    
    
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
        default:
            fatalError()
        }
        tableView.scrollToNearestSelectedRow(at: .middle, animated: true)
    }
}

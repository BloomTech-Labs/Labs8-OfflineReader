//
//  PreferencesViewController.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/8/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class PreferencesViewController: UIViewController {
    
    // MARK: - Initializers
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    
    // MARK: - View housekeeping
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferencesView.layer.cornerRadius = 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        deanimateView()
        // If you click on another tab without line 38, the view doesn't get dismissed
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var preferencesView: UIView!
    
    
    // MARK: - Actions
    
    @IBAction func dismissFromTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        
        if !preferencesView.frame.contains(location) {
            dismiss(animated: true, completion: nil)
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
}

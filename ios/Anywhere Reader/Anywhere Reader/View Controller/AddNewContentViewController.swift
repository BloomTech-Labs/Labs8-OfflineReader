//
//  AddNewContentViewController.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/14/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class AddNewContentViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        mainView.layer.cornerRadius = 10.0
        addLinkButton.layer.cornerRadius = 8.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animateView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        deanimateView()
        // Makes sure the view is dismissed even if a tab bar button is pressed
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var addLinkButton: UIButton!
    
    
    // MARK: - Actions
    
    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addLink(_ sender: Any) {
        
    }
    
    @IBAction func dismissFromTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        
        if !mainView.frame.contains(location) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Private functions
    
    private func animateView() {
        // Makes sure the main view starts out see through and 50 cgpoints below its normal frame
        mainView.alpha = 0;
        mainView.frame.origin.y = mainView.frame.origin.y + 50
        
        // Start of animation
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            // Makes main view end completely visible and at its normal frame (50 cgpoints above start) by the end of the animation
            self.mainView.alpha = 1.0
            self.mainView.frame.origin.y = self.mainView.frame.origin.y - 50
        })
    }
    
    private func deanimateView() {
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            // Opposite of animate view: makes main view fade out and move 50 cgpoints below
            self.mainView.alpha = 0
            self.mainView.frame.origin.y = self.mainView.frame.origin.y + 50
        })
    }
    
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        urlTextField.resignFirstResponder()
        return true
    }
}

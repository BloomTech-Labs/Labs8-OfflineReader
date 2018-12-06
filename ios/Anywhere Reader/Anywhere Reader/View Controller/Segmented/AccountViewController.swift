//
//  AccountViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var editCancelButton: UIButton!
    @IBOutlet weak var passwordStackView: UIStackView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet var textFields: [UITextField]!
    
    
    @IBAction func toggleEditMode(_ sender: Any) {
        let isEditing = !passwordStackView.isHidden
        if isEditing {
            for textField in textFields {
                textField.isEnabled = false
            }
            saveButton.isHidden = true
            editCancelButton.setTitle("Edit", for: .normal)
            passwordStackView.isHidden = true
        } else {
            for textField in textFields {
                textField.isEnabled = true
            }
            saveButton.isHidden = false
            editCancelButton.setTitle("Cancel", for: .normal)
            passwordStackView.isHidden = false
        }
    }
}

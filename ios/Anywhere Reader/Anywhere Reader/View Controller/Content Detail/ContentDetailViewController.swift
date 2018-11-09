//
//  ContentDetailViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class ContentDetailViewController: UIViewController {

    // MARK: - Actions
    
    @IBAction func presentPreferences(_ sender: Any) {
        let storyboard = UIStoryboard(name: "VisualPreferencesPanel", bundle: nil)
        guard let preferencesVC = storyboard.instantiateInitialViewController() else { return }
        preferencesVC.providesPresentationContextTransitionStyle = true
        preferencesVC.definesPresentationContext = true
        preferencesVC.modalPresentationStyle = .overCurrentContext
        
        // Uncomment and delte line 20 to use custom transition animation (not fully implemented at the moment)
        // preferencesVC.modalPresentationStyle = .custom
        // preferencesVC.transitioningDelegate = self
        
        self.present(preferencesVC, animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

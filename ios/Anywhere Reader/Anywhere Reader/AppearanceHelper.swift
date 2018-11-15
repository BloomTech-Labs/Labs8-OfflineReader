//
//  AppearanceHelper.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/15/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static func setUpTheme() {
        
        // Gets rid of 1px border at bottom of nav bars
        UINavigationBar.appearance().shadowImage = UIImage()
        
        // Makes all nav bars white
        UINavigationBar.appearance().barTintColor = .white
        
        // Changes the text color of labels only in contentdetailviewcontroller instances
        // UILabel.appearance(whenContainedInInstancesOf: [ContentDetailViewController.self]).textColor = .green
        
        // Makes bar buttons "disappear" when they are disabled
        let disabledBarButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        UIBarButtonItem.appearance().setTitleTextAttributes(disabledBarButtonAttributes, for: .disabled)

    }
}

//
//  UINavigationController+Extensions.swift
//  Anywhere Reader
//
//  Created by Conner on 12/4/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

extension UINavigationController {
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

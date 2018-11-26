//
//  IconViews.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/20/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

@IBDesignable class GradientIconView: UIView {
    
    @IBInspectable var iconImage: UIImage? {
        didSet {
            self.addMask(mask: iconImage)
        }
    }
    
    @IBInspectable var primaryColor: UIColor? {
        didSet {
            let secColor = secondaryColor ?? primaryColor ?? .clear
            self.addGradient(primaryColor: primaryColor ?? .clear, secondaryColor: secColor)
        }
    }
    
    @IBInspectable var secondaryColor: UIColor? {
        didSet {
            let primColor = primaryColor ?? secondaryColor ?? .clear
            self.addGradient(primaryColor: primColor, secondaryColor: secondaryColor ?? .clear)
        }
    }
}

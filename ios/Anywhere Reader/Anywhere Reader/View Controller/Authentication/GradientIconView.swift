//
//  IconViews.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/20/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

@IBDesignable class GradientIconView: UIView {
    
    var gradientLayer: CAGradientLayer?
    
    @IBInspectable var iconImage: UIImage? {
        didSet {
            self.addMask(mask: iconImage)
        }
    }
    
    @IBInspectable var primaryColor: UIColor = .clear {
        didSet {
            layer.sublayers?.removeAll()
            gradientLayer = self.addGradient(primaryColor: primaryColor, secondaryColor: secondaryColor)
        }
    }
    
    @IBInspectable var secondaryColor: UIColor = .clear {
        didSet {
            layer.sublayers?.removeAll()
            gradientLayer = self.addGradient(primaryColor: primaryColor, secondaryColor: secondaryColor)
        }
    }
    
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0) {
        didSet {
            gradientLayer?.startPoint = startPoint
        }
    }
    
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0) {
        didSet {
            gradientLayer?.endPoint = endPoint
        }
    }
}

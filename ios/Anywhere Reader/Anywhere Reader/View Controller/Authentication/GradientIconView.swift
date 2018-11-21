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
    
    /// Used as the view's layer's mask
    @IBInspectable var iconImage: UIImage? {
        didSet {
            self.addMask(mask: iconImage)
        }
    }
    
    /// The starting color of the gradient
    @IBInspectable var primaryColor: UIColor? {
        didSet {
            // Removes all sublayers before adding the new gradient
            // Use a different way to remove the previous gradientLayer from the layer's sublayers if there are other sublayers you would like to keep.
            layer.sublayers?.removeAll()
            // Sets the gradient layer and assigns it to the view's gradientLayer variable for future reference
            // If either of the gradient colors are nil, it will default to the view's backgroundColor. If the view's backgroundColor is nil, it will default to clear since the view will be transparent.
            gradientLayer = self.addGradient(primaryColor: primaryColor ?? self.backgroundColor ?? .clear, secondaryColor: secondaryColor ?? self.backgroundColor ?? .clear)
        }
    }

    /// The ending color of the gradient
    @IBInspectable var secondaryColor: UIColor? {
        didSet {
            // Removes all sublayers before adding the new gradient
            // Use a different way to remove the previous gradientLayer from the layer's sublayers if there are other sublayers you would like to keep.
            layer.sublayers?.removeAll()
            // Sets the gradient layer and assigns it to the view's gradientLayer variable for future reference
            // If either of the gradient colors are nil, it will default to the view's backgroundColor. If the view's backgroundColor is nil, it will default to clear since the view will be transparent.
            gradientLayer = self.addGradient(primaryColor: primaryColor ?? self.backgroundColor ?? .clear, secondaryColor: secondaryColor ?? self.backgroundColor ?? .clear)
        }
    }
    
    /// The starting point of the gradient
    ///
    /// The gradient's direction is determined by the line created by connecting the startPoint and endPoint.
    /// If gradientLayer is nil, it will have no effect
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0) {
        didSet {
            // Sets the startPoint of gradientLayer
            gradientLayer?.startPoint = startPoint
        }
    }
    
    /// The ending point of the gradient
    ///
    /// The gradient's direction is determined by the line created by connecting the startPoint and endPoint.
    /// If gradientLayer is nil, it will have no effect
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0) {
        didSet {
            // Sets the endPoint of gradientLayer
            gradientLayer?.endPoint = endPoint
        }
    }
}

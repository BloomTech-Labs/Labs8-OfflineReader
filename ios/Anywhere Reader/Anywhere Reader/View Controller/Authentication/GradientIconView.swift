//
//  IconViews.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/20/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

/// A subclass of UIView that provides an easy way to add a gradient and an image mask
///
/// contentMode should be set to .redraw for the gradient layer to get updated when device orientation changes etc. (Can be done in interface builder easily)
@IBDesignable
class GradientMaskView: UIView {
    
    // MARK: - IBInspectable properties
    
    /// Used as the view's layer's mask
    @IBInspectable
    var iconImage: UIImage? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The starting color of the gradient
    @IBInspectable
    var primaryColor: UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }

    /// The ending color of the gradient
    @IBInspectable
    var secondaryColor: UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The starting point of the gradient
    ///
    /// The gradient's direction is determined by the line created by connecting the startPoint and endPoint.
    /// If gradientLayer is nil, it will have no effect
    @IBInspectable
    var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The ending point of the gradient
    ///
    /// The gradient's direction is determined by the line created by connecting the startPoint and endPoint.
    /// If gradientLayer is nil, it will have no effect
    @IBInspectable
    var endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    // MARK: - Draw
    
    override func draw(_ rect: CGRect) {
        // Removes all sublayers before adding the new gradient
        // Use a different way to remove the previous gradientLayer from the layer's sublayers if there are other sublayers you would like to keep.
        layer.sublayers?.removeAll()
        // Sets the gradient layer and assigns it to the view's gradientLayer variable for future reference
        // If either of the gradient colors are nil, it will default to the view's backgroundColor. If the view's backgroundColor is nil, it will default to clear since the view will be transparent.
        let gradientLayer = self.addGradient(primaryColor: primaryColor ?? self.backgroundColor ?? .clear, secondaryColor: secondaryColor ?? self.backgroundColor ?? .clear)
        
        // Sets the start and end points of the gradient
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        if let mask = iconImage {
            self.addMask(mask: mask)
        }    }
}

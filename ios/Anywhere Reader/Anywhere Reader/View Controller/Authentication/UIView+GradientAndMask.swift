//
//  UIView+GradientAndMask.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/20/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Appends a CAGradientLayer to the end of the view's layer's sublayers
    ///
    /// Only supports two colors
    ///
    /// - Parameters:
    ///   - primaryColor: The starting UIColor of the gradient
    ///   - secondaryColor: The ending UIColor of the gradient
    ///
    /// - Returns: The appended CAGradientLayer as a discardable result
    @discardableResult
    func addGradient(primaryColor: UIColor = .red, secondaryColor: UIColor = .orange) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        self.layer.addSublayer(gradient)
        return gradient
    }
    
    /// Adds a mask to the view
    ///
    /// Creates a CALayer with the same frame as the parent view, and uses the mask argument as its contents. Sets the view's layer's mask to the new CALayer.
    ///
    /// - Parameters:
    ///   - mask: An optional UIImage that will be used as the mask. Image type should support transparency. Otherwise, nothing will be masked.
    func addMask(mask image: UIImage?) {
        let maskLayer = CALayer()
        maskLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        maskLayer.contents = image?.cgImage
        self.layer.mask = maskLayer
    }
}

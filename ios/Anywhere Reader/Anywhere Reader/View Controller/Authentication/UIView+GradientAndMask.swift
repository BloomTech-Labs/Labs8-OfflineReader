//
//  UIView+GradientAndMask.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/20/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

extension UIView {
    
    func addGradient(primaryColor: UIColor = .red, secondaryColor: UIColor = .orange) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        self.layer.addSublayer(gradient)
        return gradient
    }
    
    func addMask(mask image: UIImage?) {
        let maskLayer = CALayer()
        maskLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        maskLayer.contents = image?.cgImage
        self.layer.mask = maskLayer
    }
    
    func addMaskAndGradient(imageName: String) -> CAGradientLayer {
        let gradient = addGradient()
        addMask(mask: UIImage(named: imageName)!)
        return gradient
    }
}

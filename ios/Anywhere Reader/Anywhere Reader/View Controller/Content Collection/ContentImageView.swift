//
//  ContentImageView.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/7/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    var shadowLayer: CAShapeLayer!
    var cornerRadius: CGFloat?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius ?? 12).cgPath
            shadowLayer.fillColor = UIColor.clear.cgColor
            
            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0, height: 10)
            shadowLayer.shadowOpacity = 0.25
            shadowLayer.shadowRadius = 5
            
            layer.cornerRadius = cornerRadius ?? 12
            layer.insertSublayer(shadowLayer, at: 0)
            //layer.insertSublayer(shadowLayer, below: nil) // also works
        }
    }
    
}

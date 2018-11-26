//
//  ShapeView.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/21/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

@IBDesignable
class TrapezoidGradientView: UIView {
    
    // MARK: - IBInspectable properties
    
    @IBInspectable
    var shapeColor: UIColor = .orange {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var rightHeight: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var leftHeight: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    // MARK: - Draw
    
    override func draw(_ rect: CGRect) {
        
        let point1 = frame.origin
        let point2 = CGPoint(x: frame.size.width, y: point1.y)
        let point3 = CGPoint(x: frame.size.width, y: frame.size.height * rightHeight)
        let point4 = CGPoint(x: point1.x, y: frame.size.height * leftHeight)
        
        let path = UIBezierPath()
        
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        path.addLine(to: point4)
        path.close()
        
        shapeColor.setFill()
        
        path.fill()
    }
}

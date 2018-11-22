//
//  ShapeView.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/21/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

/// A subclass of UIView that makes it easy to render a trapezoid at the top of the view with a gradient fill
///
/// The trapezoid by default will have right angles on the top left and right vertices.
/// The only easily manipulated values of the trapezoid are the y positions of the bottom left and right vertices (i.e. leftHeight and rightHeight).
/// However, you can change the shape by manually manipulating the four points in the draw(_ rect:) override
@IBDesignable
class TrapezoidGradientView: UIView {
    
    // MARK: - IBInspectable properties
    
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
    
    /// The y value of the CGPoint for the bottom right vertex of the trapezoid
    @IBInspectable
    var rightHeight: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The y value of the CGPoint for the bottom left vertex of the trapezoid
    @IBInspectable
    var leftHeight: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The starting point of the gradient
    ///
    /// The gradient's direction is determined by the line created by connecting the startPoint and endPoint.
    /// x and y should be between 0.0 and 1.0
    @IBInspectable
    var gradientStart: CGPoint = CGPoint(x: 0.0, y: 0.0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The ending point of the gradient
    ///
    /// The gradient's direction is determined by the line created by connecting the startPoint and endPoint.
    /// x and y should be between 0.0 and 1.0
    @IBInspectable
    var gradientEnd: CGPoint = CGPoint(x: 0.0, y: 1.0) {
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
        
        // Creates a mask for the current context:
        // Gradient only shows through the fill area of the UIBezierPath
        path.addClip()
        
        // Sets the first color of the gradient to the primaryColor variable.
        // If primaryColor is nil, the secondaryColor is used.
        // If both are nil, the backgroundColor of the view is used.
        // If the backgroundColor is nil, .clear is used since the background of the view will be transparent.
        let primColor = primaryColor ?? secondaryColor ?? backgroundColor ?? .clear
        let secColor = secondaryColor ?? primaryColor ?? backgroundColor ?? .clear
        
        let colors = [primColor.cgColor, secColor.cgColor]
        
        guard let context = UIGraphicsGetCurrentContext(),
            let gradient = CGGradient(colorsSpace: nil, colors: colors as CFArray, locations: nil) else { return }
        
        // Takes the maximum y between the two bottom vertices of the trapezoid
        let maxHeight = max(point3.y, point4.y)
        // Lets the gradientStart and gradientEnd CGPoints be used like the start and end points of a CAGradientLayer
        let start = CGPoint(x: frame.size.width * gradientStart.x, y: maxHeight * gradientStart.y)
        let end = CGPoint(x: frame.size.width * gradientEnd.x, y: maxHeight * gradientEnd.y)
        
        context.drawLinearGradient(gradient, start: start, end: end, options: [])
    }
}

//
//  IconViews.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/20/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

@IBDesignable class UserIconView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addMaskAndGradient(imageName: "user")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addMaskAndGradient(imageName: "user")
    }
}

@IBDesignable class EmailIconView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addMaskAndGradient(imageName: "email")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addMaskAndGradient(imageName: "email")
    }
}

@IBDesignable class PasswordIconView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addMaskAndGradient(imageName: "password")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addMaskAndGradient(imageName: "password")
    }
}

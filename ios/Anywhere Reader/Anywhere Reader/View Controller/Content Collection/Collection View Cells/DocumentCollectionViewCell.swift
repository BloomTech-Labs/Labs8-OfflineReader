//
//  DocumentCollectionViewCell.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class DocumentCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var documentTypeLabel: UILabel!
    @IBOutlet weak var openButton: UIButton!
    @IBOutlet weak var blurLayer: UIVisualEffectView!
    @IBOutlet weak var shadowView: ShadowView!
    
    
    // MARK: - Functions
    
    func updateViews() {
        let cornerRadius: CGFloat = 20.0
        shadowView.cornerRadius = cornerRadius
        blurLayer.layer.cornerRadius = cornerRadius
        imageView.layer.cornerRadius = cornerRadius
        
        openButton.layer.cornerRadius = openButton.frame.height / 2.0
    }
}

//
//  ContentCollectionViewController+FlowLayoutDelegate.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

extension ContentCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width = collectionView.safeAreaLayoutGuide.layoutFrame.width
        
        if (self.view.traitCollection.horizontalSizeClass == .regular) {
            width /= 2
        }
        
        let size = CGSize(width: width, height: 300.0)
        return size
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout();
    }
}


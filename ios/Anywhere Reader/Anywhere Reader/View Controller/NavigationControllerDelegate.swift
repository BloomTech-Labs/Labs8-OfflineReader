//
//  NavigationControllerDelegate.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/9/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    var transitionAnimator = TransitionAnimator()
    
    // MARK: - Properties
    
    var sourceCell: UICollectionViewCell?
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if let _ = toVC as? ContentDetailViewController {
            transitionAnimator.isPresenting = true
        } else {
            transitionAnimator.isPresenting = false
        }
        
        return transitionAnimator
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return transitionAnimator.isPanning ? transitionAnimator : nil
    }
}

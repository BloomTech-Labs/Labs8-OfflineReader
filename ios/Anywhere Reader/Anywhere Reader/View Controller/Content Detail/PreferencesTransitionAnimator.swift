//
//  PreferencesTransitionAnimator.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/8/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class PreferencesTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Initializer
    
    convenience init(preferencesView: UIView) {
        self.init()
        
        self.toPreferencesView = preferencesView
    }
    
    
    // MARK: - Properties
    
    var toPreferencesView: UIView!
    
    
    // MARK: -
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to) as? PreferencesViewController,
            let toView = transitionContext.view(forKey: .to)  else { return }
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        transitionContext.containerView.addSubview(toView)
        
        // let endPreferencesViewFrame = transitionContext.containerView.convert(toPreferencesView.bounds, to: toVC.view)
        
        let animatedPreferencesViewFrame = CGRect(x: 0.0, y: 44.0, width: 20.0, height: 10.0)
        let animatedPreferencesView = UIView(frame: animatedPreferencesViewFrame)
        animatedPreferencesView.backgroundColor = .lightGray
        
        transitionContext.containerView.addSubview(animatedPreferencesView)
        
        let duration = transitionDuration(using: transitionContext)
        
        toView.layoutIfNeeded()
        UIView.animate(withDuration: duration, animations: {
            animatedPreferencesView.frame = CGRect(x: 0.0, y: 44.0, width: 20.0, height: 300.0)
        }) { success in
            toView.alpha = 1
            animatedPreferencesView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}

//
//  TransitionAnimator.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/9/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Properties
    
    var duration: TimeInterval = 0.3
    var isPresenting = true
    
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from),
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        let detailView = isPresenting ? toView : fromView
        
        if isPresenting {
            container.addSubview(toView)
            toView.frame = CGRect(x: fromView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height)
        } else {
            container.insertSubview(toView, belowSubview: fromView)
        }
        
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            if self.isPresenting {
                detailView.frame = fromView.frame
            } else {
                detailView.frame = CGRect(x: toView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height)
            }
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}

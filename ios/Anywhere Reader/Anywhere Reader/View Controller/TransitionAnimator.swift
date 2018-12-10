//
//  TransitionAnimator.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/9/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class TransitionAnimator: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Properties
    
    public var isPresenting = true
    public var isPanning = false
    
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
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
        
        UIView.animate(withDuration: 0.3, animations: {
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

extension TransitionAnimator: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        // Presenting usually doesn't have any interactivity
        return nil
    }
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self
    }
}

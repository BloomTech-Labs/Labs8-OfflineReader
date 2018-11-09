//
//  ContentDetailViewController+TransitioningDelegate.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/8/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

extension ContentDetailViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            
            guard let preferencesView = presented.view.subviews.first else { return nil }
            
            return PreferencesTransitionAnimator(preferencesView: preferencesView)
    }
}

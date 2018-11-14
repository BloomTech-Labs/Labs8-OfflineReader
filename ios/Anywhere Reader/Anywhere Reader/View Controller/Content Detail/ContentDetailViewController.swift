//
//  ContentDetailViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class ContentDetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Properties
    var article: Article? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentBodyLabel: UILabel!

    // MARK: - Actions
    @IBAction func presentPreferences(_ sender: Any) {
        let storyboard = UIStoryboard(name: "VisualPreferencesPanel", bundle: nil)
        guard let preferencesVC = storyboard.instantiateInitialViewController() else { return }
        preferencesVC.providesPresentationContextTransitionStyle = true
        preferencesVC.definesPresentationContext = true
        preferencesVC.modalPresentationStyle = .overCurrentContext
        preferencesVC.modalTransitionStyle = .crossDissolve
        
        self.present(preferencesVC, animated: true, completion: nil)
    }
    
    // MARK: - Private
    private func updateViews() {
        guard let article = article else { return }
        
        titleLabel.text = article.title
        contentBodyLabel.text = article.articleContent
    }
}

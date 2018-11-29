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
        updateTheme()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTheme), name: UserDefaults.didChangeNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // MARK: - Private properties
    
    let themeHelper = UserDefaultsThemeHelper.shared
    
    
    // MARK: - Public properties
    
    public var article: Article? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentBodyLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var sourceAndDateLabel: UILabel!
    
    
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
        do {
            let url = URL(string: article.coverImage)!
            let data = try Data(contentsOf: url)
            imageView.image = UIImage(data: data)
        }
        catch {
            NSLog("Error setting image in detail view")
        }
    }
    
    @objc private func updateTheme() {
        let backgroundColor = themeHelper.getBackgroundColor()
        view.backgroundColor = backgroundColor
        contentView.backgroundColor = backgroundColor
        contentBodyLabel.textColor = themeHelper.getTextColor()
        titleLabel.textColor = themeHelper.getTextColor()
        sourceAndDateLabel.textColor = themeHelper.getTextColor()
        
        let titleFont = themeHelper.getTitleFont()
        titleLabel.font = titleFont
        let bodyFont = themeHelper.getBodyFont()
        contentBodyLabel.font = bodyFont
        sourceAndDateLabel.font = bodyFont
    }
}

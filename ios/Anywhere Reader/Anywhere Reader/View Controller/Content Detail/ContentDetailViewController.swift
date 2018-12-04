//
//  ContentDetailViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import Kingfisher

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
    
    public var article: ArticleRep? {
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
    @IBOutlet weak var authorLabel: UILabel!
    
    
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
        contentBodyLabel.text = article.text
        authorLabel.text = article.author
        
        let url = URL(string: article.coverImage)
        imageView.kf.setImage(with: url)
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

        // Gradient Layer for top image
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageView.bounds

        // Colors for gradient
        gradientLayer.colors = [
            UIColor.white.withAlphaComponent(1).cgColor,
            UIColor.white.withAlphaComponent(0).cgColor]

        // Direction of gradient
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.70)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        imageView.layer.mask = gradientLayer
    }
}

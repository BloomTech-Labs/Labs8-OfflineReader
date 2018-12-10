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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { [unowned self] _ in
            self.gradientLayer.frame = self.imageView.bounds
        })
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = imageView.bounds
    }

    // MARK: - Private properties

    let themeHelper = ThemeHelper.shared
    let gradientLayer = CAGradientLayer()

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
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tagLabelOne: UILabel!
    @IBOutlet weak var tagLabelTwo: UILabel!
    @IBOutlet weak var tagLabelThree: UILabel!
    @IBOutlet weak var tagLabelFour: UILabel!
    @IBOutlet weak var tagLabelFive: UILabel!


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
        
        setupTagLabels()
    }

    @objc private func updateTheme() {
        let backgroundColor = themeHelper.getBackgroundColor()
        view.backgroundColor = backgroundColor
        contentView.backgroundColor = backgroundColor
        navigationController?.navigationBar.barTintColor = backgroundColor
        navigationController?.navigationBar.tintColor = themeHelper.getTextColor()

        [contentBodyLabel, titleLabel, authorLabel, dateLabel]
            .forEach { $0.textColor = themeHelper.getTextColor() }
        
        [contentBodyLabel, authorLabel, dateLabel]
            .forEach { $0.font = themeHelper.getBodyFont() }

        let titleFont = themeHelper.getTitleFont()
        titleLabel.font = titleFont

        // Gradient Layer for top image
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
    
    private func setupTagLabels() {
        guard let article = article else { return }
        
        let tagLabels = [tagLabelOne, tagLabelTwo, tagLabelThree, tagLabelFour, tagLabelFive]
        
        // Get each tag, separated by a single comma, make sure each is capitalized
        let tags = article.tags.split(separator: ",").map { $0.capitalized }
        // If there are less tags than labels, hide the other tags
        if tags.count < tagLabels.count {
            // Tag labels up to the count of tags
            let tagLabelsToUpdate = tagLabels.prefix(tags.count)
            // Leftover tag labels to hide
            let leftoverTagLabels = tagLabels[tags.count...tagLabels.count-1]
            // Update text for each label
            tagLabelsToUpdate.enumerated().forEach { (index, label) in
                label?.text = tags[index]
            }
            // Hide the leftover labels
            leftoverTagLabels.forEach { $0?.isHidden = true }
        } else {
            // There are more tags than tagLabels (5), update each accordingly
            tagLabels.enumerated().forEach { (index, label) in
                label?.text = tags[index]
            }
        }
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        let textColor = themeHelper.getTextColor()
        switch textColor {
        case .black:
            return .default
        case .white:
            return .lightContent
        default:
            return .lightContent
        }
    }
}


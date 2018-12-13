//
//  DocumentCollectionViewCell.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var article: Article? {
        didSet {
            updateViews()
        }
    }

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    // MARK: - Functions
    func updateViews() {
        guard let article = article else { return }
        
        let processor = OverlayImageProcessor(overlay: .black, fraction: 0.5) >> BlurImageProcessor(blurRadius: 6.0)
        let url = URL(string: article.coverImage ?? "")
        imageView.kf.setImage(with: url, options: [.processor(processor), .memoryCacheExpiration(.never)])
        
        titleLabel.text = article.title
        sourceLabel.text = article.author
        dateLabel.text = "Saved on \(DateHelper.shared.ISODateToNormalDate(date: article.dateSaved ?? ""))"
    }
}

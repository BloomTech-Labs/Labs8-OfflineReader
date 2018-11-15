//
//  Content.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

struct Articles: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let id: String
    let url: String // TODO: - Change to URL?
    let title: String
    let coverImage: String // TODO: - Change to URL?
    let blurb, dateSaved, savedHTML, articleContent: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case url, title
        case coverImage = "cover_image"
        case blurb
        case dateSaved = "date_saved"
        case savedHTML = "saved_html"
        case articleContent = "article_content"
    }
}

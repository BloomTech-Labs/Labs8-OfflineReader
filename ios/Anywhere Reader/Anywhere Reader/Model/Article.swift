//
//  Content.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

typealias Articles = [Article]

struct Article: Codable {
    let id: Int
    let title: String
    let author: String
    let normalURL: String
    let resolvedURL: String
    let dateSaved: String
    let datePublished: String
    let excerpt: String
    let coverImage: String
    let tags: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case author = "author"
        case normalURL = "normal_url"
        case resolvedURL = "resolved_url"
        case dateSaved = "date_saved"
        case datePublished = "date_published"
        case excerpt = "excerpt"
        case coverImage = "cover_image"
        case tags = "tags"
        case text = "text"
    }
}

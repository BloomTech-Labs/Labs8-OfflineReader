//
//  Article+Encodable.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import CoreData

extension Article: Encodable {
    
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
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(author, forKey: .author)
        try container.encode(normalURL, forKey: .normalURL)
        try container.encode(resolvedURL, forKey: .resolvedURL)
        try container.encode(dateSaved, forKey: .dateSaved)
        try container.encode(datePublished, forKey: .datePublished)
        try container.encode(excerpt, forKey: .excerpt)
        try container.encode(coverImage, forKey: .coverImage)
        try container.encode(tags, forKey: .tags)
        try container.encode(text, forKey: .text)
    }
}

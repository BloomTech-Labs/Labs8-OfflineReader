//
//  Content.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

typealias Articles = [ArticleRep]

struct ArticleRep: Codable, Equatable {
    let id: Int32
    let title: String
    let author: String
    let normalURL: String
    let resolvedURL: String
    let dateSaved: String
    let datePublished: String
    let excerpt: String
    let coverImage: String
    let text: String
    let userID: Int32
    
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
        case video = "video"
        case audio = "audio"
        case html = "html"
        case images = "images"
        case text = "text"
        case userID = "user_id"
    }
}

func == (lhs: ArticleRep, rhs: Article) -> Bool {
    return
        lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.author == rhs.author &&
            lhs.normalURL == rhs.normalURL &&
            lhs.resolvedURL == rhs.resolvedURL &&
            lhs.dateSaved == rhs.dateSaved &&
            lhs.datePublished == rhs.datePublished &&
            lhs.excerpt == rhs.excerpt &&
            lhs.coverImage == rhs.coverImage &&
            lhs.text == rhs.text &&
            lhs.userID == rhs.userID
}

func == (lhs: Article, rhs: ArticleRep) -> Bool {
    return rhs == lhs
}

func != (lhs: ArticleRep, rhs: Article) -> Bool {
    return !(rhs == lhs)
}

func != (lhs: Article, rhs: ArticleRep) -> Bool {
    return rhs != lhs
}

//
//  ContentController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

class ArticleController {
    // MARK: - Properties
    var articles: [Article] = []
    var mockDataURL: URL {
        return Bundle.main.url(forResource: "example", withExtension: "json")!
    }
    
    func fetchLocalArticles() {
        do {
            let mockData = try Data(contentsOf: mockDataURL)
            self.articles = Array(try JSONDecoder().decode(Articles.self, from: mockData).articles)
        } catch {
            NSLog("Error decoding example data: \(error)")
        }
    }
}

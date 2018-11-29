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
    static let baseURL = URL(string: "http://localhost:8000")!
    var mockDataURL: URL {
        return Bundle.main.url(forResource: "example", withExtension: "json")!
    }
    var articles: [Article] = []
    
//    func fetchArticles(for user: User, fetchArticlesComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
//
//        guard let key = user.key?.key else { return }
//
//        // http://localhost:8000/pages/
//        let url = AuthService.baseURL.appendingPathComponent("pages/")
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue("Token \(key)", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { (data, _, error) in
//            if let error = error {
//                NSLog("Error with fetching articles: \(error)")
//                fetchArticlesComplete(false, error)
//                return
//            }
//
//            guard let data = data else { return }
//
//            do {
//                self.articles = try JSONDecoder().decode(Articles.self, from: data)
//            } catch {
//                NSLog("Error decoding articles")
//            }
//            fetchArticlesComplete(true, nil)
//        }.resume()
//    }
    
    func fetchArticles(for user: User, fetchArticlesComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        do {
            let mockData = try Data(contentsOf: mockDataURL)
            self.articles = try JSONDecoder().decode(Articles.self, from: mockData)
        } catch {
            NSLog("Error decoding example data: \(error)")
        }
    }
}

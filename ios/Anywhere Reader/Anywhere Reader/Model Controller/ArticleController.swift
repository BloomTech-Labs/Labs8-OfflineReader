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
    let baseURL = URL(string: "https://anywhere-reader-test.herokuapp.com")!
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
    
    // MARK: - Scraper Query
    
    func scrape(with userInputURL: String, completion: @escaping (Result) -> Void) {
        // Endpoint : anywhere-reader-test.herokuapp.com/api/scrape/
        let url = baseURL.appendingPathComponent("api").appendingPathComponent("scrape/")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body: [String: Any] = ["url": userInputURL]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        // TODO: Use user token rather than placeholder
        request.allHTTPHeaderFields = ["Authorization": "Token e5f6efffdaf49d83381c94a7a322266e77013428", "Content-Type": "application/json"]
        
        URLSession.shared.dataTask(with: request) { (data, responseCode, error) in
            if let error = error {
                NSLog("Error with scraping: \(error)")
                completion(Result.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let article = try JSONDecoder().decode(Article.self, from: data)
                self.articles.append(article)
            } catch let decodeError {
                NSLog("Error with decoding article")
                completion(Result.failure(decodeError))
            }
            
            completion(Result.success)
        }.resume()
    }
}

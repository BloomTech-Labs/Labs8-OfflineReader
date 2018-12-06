//
//  ContentController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation
import CoreData

class ArticleController {
    
    // MARK: - Properties
    
    let baseURL = URL(string: "https://anywhere-reader-test.herokuapp.com")!
    var mockDataURL: URL {
        return Bundle.main.url(forResource: "example", withExtension: "json")!
    }
    var articleReps: [ArticleRep] = []
    
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
//                // Uncomment to update core data
//                // let backgroundContext = CoreDataStack.shared.container.newBackgroundContext()
//                // try self.updateArticles(from: self.articles, context: backgroundContext)
//            } catch {
//                NSLog("Error decoding articles")
//            }
//            fetchArticlesComplete(true, nil)
//        }.resume()
//    }
    
    func fetchArticles(fetchArticlesComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        do {
            let mockData = try Data(contentsOf: mockDataURL)
            self.articleReps = try JSONDecoder().decode(Articles.self, from: mockData)
            fetchArticlesComplete(true, nil)
        } catch {
            NSLog("Error decoding example data: \(error)")
            fetchArticlesComplete(false, error)
        }
    }
    
    
    // MARK: - Core Data
    
    private func save(context: NSManagedObjectContext) {
        context.performAndWait {
            do {
                try context.save()
            }
            catch {
                NSLog("Error saving entry: \(error)")
            }
        }
    }
    
    private func loadSingleArticle(id: Int32, context: NSManagedObjectContext) -> Article? {
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            NSLog("Error fetching group: \(error)")
            return nil
        }
    }
    
    private func deleteArticles(with ids: [Int32], context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "NOT (id IN %@)", ids)
        
        var articlesToDelete: [Article] = []
        do {
            articlesToDelete = try context.fetch(fetchRequest)
        } catch {
            NSLog("Error fetching group: \(error)")
            return
        }
        
        for articleToDelete in articlesToDelete {
            context.delete(articleToDelete)
        }
        
        save(context: context)
    }
    
    private func update(article: Article, from articleRep: ArticleRep) {
        
        // TODO: Add other property updates if changing them will be supported from the api
        article.tags = articleRep.tags
    }
    
    private func updateArticles(from articleReps: [ArticleRep], context: NSManagedObjectContext) throws {
        context.performAndWait {
            var articleIDs: [Int32] = []
            for articleRep in articleReps {
                if let article = loadSingleArticle(id: articleRep.id, context: context) {
                    if article != articleRep {
                        self.update(article: article, from: articleRep)
                    }
                } else {
                    _ = Article(fromRep: articleRep, context: context)
                }
                articleIDs.append(articleRep.id)
            }
            save(context: context)
            deleteArticles(with: articleIDs, context: context)
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
                let articleRep = try JSONDecoder().decode(ArticleRep.self, from: data)
                // Uncomment to update core data
                // let _ = Article(fromRep: articleRep)
                // self.save(context: CoreDataStack.moc)
                self.articleReps.append(articleRep)
            } catch let decodeError {
                NSLog("Error with decoding article")
                completion(Result.failure(decodeError))
            }
            
            completion(Result.success)
        }.resume()
    }
}

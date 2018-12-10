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
    
    // MARK: - Init
    
    init(dataLoader: NetworkDataLoader = URLSession.shared) {
        self.dataLoader = dataLoader
    }
    
    
    // MARK: - Properties
    
    let dataLoader: NetworkDataLoader
    static let baseURL = URL(string: "https://anywhere-reader-test.herokuapp.com")!
    var articleReps: [ArticleRep] = []
    
    
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
    
    
    // MARK: - Network requests
    
    func fetchArticles(completion: @escaping (_ error: NetworkError?) -> ()) {
        
        let url = ArticleController.baseURL.appendingPathComponent("pages/")
        
        let key = "key"
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Token \(key)", forHTTPHeaderField: "Authorization")
        
        dataLoader.loadData(with: request) { (data, error) in
            if let error = error {
                NSLog("Error with fetching articles: \(error)")
                completion(.general)
                return
            }
            
            guard let data = data else { completion(.noData); return }
            
            do {
                let articleReps = try JSONDecoder().decode(Articles.self, from: data)
                self.articleReps = articleReps
                // Uncomment when using core data
                // let backgroundContext = CoreDataStack.shared.container.newBackgroundContext()
                // try self.updateArticles(from: articleReps, context: backgroundContext)
                completion(nil)
            } catch {
                NSLog("Error decoding articles")
                completion(.badData)
            }
        }
    }
    
    /// Scraper query
    func scrape(with userInputURL: String, completion: @escaping (NetworkError?) -> Void) {
        // Endpoint : anywhere-reader-test.herokuapp.com/api/scrape/
        let url = ArticleController.baseURL.appendingPathComponent("api").appendingPathComponent("scrape/")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body: [String: Any] = ["url": userInputURL]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        // TODO: Use user token rather than placeholder
        request.allHTTPHeaderFields = ["Authorization": "Token e5f6efffdaf49d83381c94a7a322266e77013428", "Content-Type": "application/json"]
        
        dataLoader.uploadData(with: request) { (data, error) in
            if let error = error {
                NSLog("Error with scraping: \(error)")
                completion(.general)
                return
            }
            
            guard let data = data else { completion(.noData); return }
            
            do {
                let articleRep = try JSONDecoder().decode(ArticleRep.self, from: data)
                self.articleReps.append(articleRep)
                // Uncomment when using core data
                // let _ = Article(fromRep: articleRep)
                // self.save(context: CoreDataStack.moc)
                completion(nil)
            } catch {
                NSLog("Error with decoding article")
                completion(.badData)
            }
        }
    }
}

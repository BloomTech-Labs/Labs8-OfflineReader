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
    
    /**
     Initializes a new instance of the ArticleController class
     
     If no dataLoader is passed in, the ArticleController will use the shared instance of [URLSession](https://developer.apple.com/documentation/foundation/urlsession) to perform all data tasks
     
     - Author: Samantha Gatt
     
     - Parameter dataLoader: An object that conforms to the protocol defined in NetworkDataLoader.swift
     */
    init(dataLoader: NetworkDataLoader = URLSession.shared) {
        self.dataLoader = dataLoader
    }
    
    
    // MARK: - Properties
    
    let dataLoader: NetworkDataLoader
    static let baseURL = URL(string: "https://anywhere-reader-test.herokuapp.com")!
    
    
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
    
    /**
     Fetches the article from core data with the an id equal to the integer passed in
     
     The id property is unique so only one article will be returned. If more than one article is in the [NSFetchRequest](https://developer.apple.com/documentation/coredata/nsfetchrequest) resulting Article array only the first will be returned.
     
     - Author: Samantha Gatt
     
     - Parameters:
         - id: The id of the requested article as an Int32
         - context: The [NSManagedObjectContext](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext) for the fetch request to be performed
     
     - Returns: An optional Article instance with the id requested. If no Article saved in CoreData is found, nil is returned.
     */
    private func loadSingleArticle(id: Int32, context: NSManagedObjectContext) -> Article? {
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %i", id)
        
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            NSLog("Error fetching group: \(error)")
            return nil
        }
    }
    
    /**
     Deletes all articles with ids that are not found in the ids that are passed in
     
     - Author: Samantha Gatt
     
     - Parameters:
         - ids: All the ids you DO NOT want deleted as an array of Int32
         - context: The [NSManagedObjectContext](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext) for the fetch request and deletion to be performed
     */
    private func deleteArticles(notIn ids: [Int32], context: NSManagedObjectContext) {
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
    
    /**
     Updates an Article with the information provided from an ArticleRep
     
     - Author: Samantha Gatt
     
     - Parameters:
        - article: The Article to be updated
        - articleRep: The ArticleRep with the new information
     */
    private func update(article: Article, from articleRep: ArticleRep) {
        
        article.id = articleRep.id
        article.title = articleRep.title
        article.author = articleRep.title
        article.normalURL = articleRep.normalURL
        article.resolvedURL = articleRep.resolvedURL
        article.dateSaved = articleRep.dateSaved
        article.datePublished = articleRep.datePublished
        article.excerpt = articleRep.excerpt
        article.coverImage = articleRep.coverImage
        article.text = articleRep.text
        article.userID = articleRep.userID
    }
    
    /**
     Updates or creates Articles based on the ArticleReps that are passed into the function
     
     For each ArticleRep passed in, it checks to see if an Article already exists in CoreData with the ArticleRep's id. If it does exist but is different than the ArticleRep, it updates the Article with the ArticleRep's information. If it doesn't exist in CoreData, a new instance of Article is created. At the end of the function, all Articles with ids that are not contained in the array of ArticleReps are deleted.
     
     - Note: This should only be used if you don't want to keep the Articles with the ids NOT EQUAL to those in the array of ArticleReps. All other Articles in CoreData will be deleted.
     
     - Author: Samantha Gatt
     
     - Parameters:
         - articleReps: An array of ArticleReps that will be used to update/create Articles in CoreData
         - context: The [NSManagedObjectContext](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext) for the creation, update, and deletion to be performed
     */
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
            // The deleteArticles function saves everything on the context so it doesn't need to be called before the above line
            deleteArticles(notIn: articleIDs, context: context)
        }
    }
    
    
    // MARK: - Network requests
    
    /**
     Fetches Articles stored by current user from the web API
     
     - Author: Conner Alegre
     
     - Parameters:
        - completion: A block of code to be executed when the function has been completed
        - error: An optional NetworkError declared in NetworkError.swift
     */
    func fetchArticles(completion: @escaping (_ error: NetworkError?) -> Void) {
        let url = ArticleController.baseURL.appendingPathComponent("api").appendingPathComponent("pages/")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(APIService.currentUserToken)", forHTTPHeaderField: "Authorization")
        
        dataLoader.loadData(with: request) { (data, error) in
            if let error = error {
                NSLog("Error with fetching articles: \(error)")
                completion(.general)
                return
            }
            
            guard let data = data else { completion(.noData); return }
            
            do {
                let articleReps = try JSONDecoder().decode(Articles.self, from: data)
                let backgroundContext = CoreDataStack.shared.container.newBackgroundContext()
                try self.updateArticles(from: articleReps, context: backgroundContext)
                completion(nil)
            } catch {
                NSLog("Error decoding articles")
                completion(.badData)
            }
        }
    }
    
    /**
     Sends a URL as a String to the web API scraper to be added to the users saved articles
     
     - Author: Conner Alegre
     
     - Parameters:
         - userInputURL: The URL to be sent to the web API scraper as a String
         - completion: A block of code to be executed when the function has been completed
         - error: An optional NetworkError declared in NetworkError.swift
     */
    func scrape(with userInputURL: String, completion: @escaping (_ error: NetworkError?) -> Void) {
        // Endpoint : anywhere-reader-test.herokuapp.com/api/scrape/
        let url = ArticleController.baseURL.appendingPathComponent("api").appendingPathComponent("scrape/")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body: [String: Any] = ["url": userInputURL]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        // TODO: Use user token rather than placeholder
        request.allHTTPHeaderFields = ["Authorization": "Bearer \(APIService.currentUserToken)", "Content-Type": "application/json"]
        
        dataLoader.uploadData(with: request) { (data, error) in
            if let error = error {
                NSLog("Error with scraping: \(error)")
                completion(.general)
                return
            }
            
            guard let data = data else { completion(.noData); return }
            
            do {
                let articleRep = try JSONDecoder().decode(ArticleRep.self, from: data)
                let _ = Article(fromRep: articleRep)
                self.save(context: CoreDataStack.moc)
                completion(nil)
            } catch {
                NSLog("Error with decoding article")
                completion(.badData)
            }
        }
    }
}

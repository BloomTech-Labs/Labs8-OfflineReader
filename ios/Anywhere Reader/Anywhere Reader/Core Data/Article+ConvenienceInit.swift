//
//  Article+ConvenienceInit.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import CoreData

extension Article {
    convenience init(fromRep articleRep: ArticleRep, context: NSManagedObjectContext = CoreDataStack.moc) {
        self.init(context: context)
        
        self.id = Int32(articleRep.id)
        self.title = articleRep.title
        self.author = articleRep.author
        self.normalURL = articleRep.normalURL
        self.resolvedURL = articleRep.resolvedURL
        self.dateSaved = articleRep.dateSaved
        self.datePublished = articleRep.datePublished
        self.excerpt = articleRep.excerpt
        self.coverImage = articleRep.coverImage
        self.text = articleRep.text
        self.userID = articleRep.userID
    }
}

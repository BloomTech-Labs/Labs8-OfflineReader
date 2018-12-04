//
//  CoreDataStack.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Anywhere Reader")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent store: \(error)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    static let moc = CoreDataStack.shared.mainContext
}

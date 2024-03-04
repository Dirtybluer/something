//
//  Persistence.swift
//  Something
//
//  Created by 张萌琦 on 2024/3/1.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    private let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }

    private init() {
        container = NSPersistentContainer(name: "Something")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load store with error: \(error)")
            }
        }
    }
} 

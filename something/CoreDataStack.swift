//
//  CoreDataStack.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//

import CoreData

class CoreDataStack: ObservableObject {
    static let shared = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Something")
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    private init() {
//        create initial dummy data for coachEnd
        let resoureNames = ["LessonGroup", "ScheduleItem"]
        var resourceCSVData = CSVData(resourceNames: resoureNames)
        for resourceName in resoureNames {
            if let numOfRows = resourceCSVData.getData()[resourceName]?.count {
                for rowNumber in 1..<numOfRows {
                    if resourceName == "LessonGroup" {
                        
                    }
                    else if resourceName == "ScheduleItem" {
                        
                    }
                }
            }
        }
        self.save()
    }
    
    func save() {
        guard persistentContainer.viewContext.hasChanges else { return }
                
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save the context:", error.localizedDescription)
        }
    }
    
//    var viewContext: NSManagedObjectContext {
//        container.viewContext
//    }

//    private init() {
//        container = NSPersistentContainer(name: "Something")
//        container.viewContext.automaticallyMergesChangesFromParent = true
//        container.loadPersistentStores { _, error in
//            if let error {
//                fatalError("Unable to load store with error: \(error)")
//            }
//        }
//    }
}


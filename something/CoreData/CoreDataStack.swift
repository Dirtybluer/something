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
    
    static var preview: CoreDataStack = {
        let coreDataStack = CoreDataStack(inMemory: true)
        let context = coreDataStack.persistentContainer.viewContext
        
        return coreDataStack
    }()
    
    private init(inMemory: Bool = false) {
        
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
//      create initial dummy data for coachEnd at the first launch
        let isFirstLaunch = UserDefaults.standard.bool(forKey: "isFirstLaunch")
        if isFirstLaunch == false {
            // This is the first launch ever
            print("First launch, isFirstLaunch: \(isFirstLaunch)")
            UserDefaults.standard.set(true, forKey: "isFirstLaunch")
            UserDefaults.standard.synchronize()
            
            // Create initial dummy data for coachEnd
            // the order matters
            GroupLesson.createDummyData(context: self.persistentContainer.viewContext)
            self.save()
            Instructor.createDummyData(context: self.persistentContainer.viewContext)
            self.save()
            ScheduleItem.createDummyData(context: self.persistentContainer.viewContext)
            self.save()
        }
        else {
            print("Subsequent launch, isFirstLaunch: \(isFirstLaunch)")
        }
    }
    
    func save() {
        guard persistentContainer.viewContext.hasChanges else { return }
                
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save the context:", error.localizedDescription)
        }
    }
}


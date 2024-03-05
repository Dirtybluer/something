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
            let resourceNames = ["LessonGroup", "Instructor", "ScheduleItem"]
            let resourceCSVData = CSVData(resourceNames: resourceNames)
            for resourceName in resourceNames {
                if let numOfRows = resourceCSVData.getData()[resourceName]?.count {
                    for rowNumber in 1..<numOfRows {
                        let resourceRow = resourceCSVData.getData()[resourceName]![rowNumber]
                        if resourceName == "LessonGroup" {
//                             Create LessonGroup entity and set its properties
//                            todo: move the following code into a class function of LessonGroup
                            let newGroupLesson = NSEntityDescription.insertNewObject(forEntityName: "GroupLesson", into: self.persistentContainer.viewContext) as! GroupLesson
                            newGroupLesson.name = resourceRow[0]
                            newGroupLesson.templateID = Int64(resourceRow[1])!
                            newGroupLesson.shortName = resourceRow[2]
                            newGroupLesson.describe = resourceRow[3]
                            newGroupLesson.discipline = resourceRow[4]
                            newGroupLesson.guestType = resourceRow[5]
                            newGroupLesson.requiredCertificate = resourceRow[6]
                            newGroupLesson.startTime = resourceRow[7]
                            newGroupLesson.endTime = resourceRow[8]
                            newGroupLesson.meetingPoint = resourceRow[9]
                            
                            self.save()
                        } else if resourceName == "Instructor" {
                            let newInstructor = NSEntityDescription.insertNewObject(forEntityName: "Instructor", into: self.persistentContainer.viewContext) as! Instructor
                            
                            newInstructor.id = Int64(resourceRow[0])!
                            newInstructor.name = resourceRow[1]
                            newInstructor.skiName = resourceRow[2]
                            newInstructor.residence = resourceRow[3]
                            newInstructor.skill = resourceRow[4]
                            newInstructor.skiLevel = resourceRow[5]
                            newInstructor.sbLevel = resourceRow[6]
                            
                        } else if resourceName == "ScheduleItem" {
                            // Create ScheduleItem entity and set its properties
                            let newScheduleItem = NSEntityDescription.insertNewObject(forEntityName: "ScheduleItem", into: self.persistentContainer.viewContext) as! ScheduleItem
                            newScheduleItem.scheduleName = resourceRow[0]
                            newScheduleItem.scheduleDescribe = resourceRow[1]
                            newScheduleItem.meetingPoint = resourceRow[2]
                            newScheduleItem.date = generateDateFromString(dateString: resourceRow[3])
                            newScheduleItem.startTime = resourceRow[4]
                            newScheduleItem.endTime = resourceRow[5]
                            newScheduleItem.scheduleType = resourceRow[6]
                            newScheduleItem.scheduleItemTemplate = TemplateItem.withID(Int64(resourceRow[7])!, context: self.persistentContainer.viewContext)
                            newScheduleItem.signUpNumber = Int64(resourceRow[8]) ?? -1
                            
                            // currently the code assumes that there's always only one instructor
                            if let instructor = Instructor.withSkiName(resourceRow[9].uppercased(), context: self.persistentContainer.viewContext) {
                                newScheduleItem.instructors = NSSet(array: [instructor])
                            }
                            newScheduleItem.gmtCreate = Date()
                            newScheduleItem.gmtModify = nil
                            newScheduleItem.instructorNum = Int64(resourceRow[12]) ?? -1
                            
                            
//                            print("\(newScheduleItem.instructors?.count)")
                            self.save()
                        }
                    }
                    print("Finished generating dummy data for \"\(resourceName)\"")
                }
            }
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


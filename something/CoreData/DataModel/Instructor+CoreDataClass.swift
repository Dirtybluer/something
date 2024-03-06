//
//  Instructor+CoreDataClass.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//
//

import Foundation
import CoreData


public class Instructor: NSManagedObject {
    static func withSkiName(_ skiName: String, context: NSManagedObjectContext) -> Instructor? {
        // look up template id in core data
        let request = NSFetchRequest<Instructor>(entityName: "Instructor")
        request.predicate = NSPredicate(format: "skiName = %@", skiName)
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        let Instructors = (try? context.fetch(request)) ?? []
        
        if let Instructor = Instructors.first {
//            print("found instructor with skiName \(skiName)")
            return Instructor
        } else {
            print("not found instructor with skiName \(skiName)")
            return nil
        }
    }
    
    static func addNewInstructor(context: NSManagedObjectContext, id:  Int64?, name: String?, skiName: String?, residence: String?, skill: String?, skiLevel: String?, sbLevel: String?) {
        
        let newInstructor = NSEntityDescription.insertNewObject(forEntityName: "Instructor", into: context) as! Instructor
        
        if let id = id {
            newInstructor.id = id
        }
        newInstructor.name = name
        newInstructor.skiName = skiName
        newInstructor.residence = residence
        newInstructor.skill = skill
        newInstructor.skiLevel = skiLevel
        newInstructor.sbLevel = sbLevel
    }
    
    static func createDummyData(context: NSManagedObjectContext) {
        let resourceName = "Instructor"
        
        if let resourceCSVData = CSVData(resourceNames: [resourceName]).getData()[resourceName] {
            
            let numOfRows = resourceCSVData.count
            
            for rowNumber in 1..<numOfRows {
                let resourceRow = resourceCSVData[rowNumber]
                
                Instructor.addNewInstructor(context: context, id: Int64(resourceRow[0]), name: resourceRow[1], skiName: resourceRow[2], residence: resourceRow[3], skill: resourceRow[4], skiLevel: resourceRow[5], sbLevel: resourceRow[6])
            }
        } else {
            print("Failed to read dummy data for Instructor")
        }
    }
}

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
            print("found instructor with skiName \(skiName)")
            return Instructor
        } else {
            return nil
        }
    }
}

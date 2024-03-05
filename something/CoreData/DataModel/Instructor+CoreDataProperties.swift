//
//  Instructor+CoreDataProperties.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//
//

import Foundation
import CoreData


extension Instructor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Instructor> {
        return NSFetchRequest<Instructor>(entityName: "Instructor")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var residence: String?
    @NSManaged public var sbLevel: String?
    @NSManaged public var skiLevel: String?
    @NSManaged public var skiName: String?
    @NSManaged public var skill: String?
    @NSManaged public var scheduleItems: NSSet?

}

// MARK: Generated accessors for scheduleItems
extension Instructor {

    @objc(addScheduleItemsObject:)
    @NSManaged public func addToScheduleItems(_ value: ScheduleItem)

    @objc(removeScheduleItemsObject:)
    @NSManaged public func removeFromScheduleItems(_ value: ScheduleItem)

    @objc(addScheduleItems:)
    @NSManaged public func addToScheduleItems(_ values: NSSet)

    @objc(removeScheduleItems:)
    @NSManaged public func removeFromScheduleItems(_ values: NSSet)

}

extension Instructor : Identifiable {

}

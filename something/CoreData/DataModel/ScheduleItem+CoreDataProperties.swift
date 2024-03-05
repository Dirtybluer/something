//
//  ScheduleItem+CoreDataProperties.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//
//

import Foundation
import CoreData


extension ScheduleItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScheduleItem> {
        return NSFetchRequest<ScheduleItem>(entityName: "ScheduleItem")
    }

    @NSManaged public var date: Date?
    @NSManaged public var endTime: String?
    @NSManaged public var gmtCreate: Date?
    @NSManaged public var gmtModify: Date?
    @NSManaged public var instructorNum: Int64
    @NSManaged public var meetingPoint: String?
    @NSManaged public var scheduleDescribe: String?
    @NSManaged public var scheduleItemID: UUID?
    @NSManaged public var scheduleName: String?
    @NSManaged public var scheduleType: String?
    @NSManaged public var signUpNumber: Int64
    @NSManaged public var startTime: String?
    @NSManaged public var instructors: NSSet?
    @NSManaged public var scheduleItemTemplate: TemplateItem?

}

// MARK: Generated accessors for instructors
extension ScheduleItem {

    @objc(addInstructorsObject:)
    @NSManaged public func addToInstructors(_ value: Instructor)

    @objc(removeInstructorsObject:)
    @NSManaged public func removeFromInstructors(_ value: Instructor)

    @objc(addInstructors:)
    @NSManaged public func addToInstructors(_ values: NSSet)

    @objc(removeInstructors:)
    @NSManaged public func removeFromInstructors(_ values: NSSet)

}

extension ScheduleItem : Identifiable {

}

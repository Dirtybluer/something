//
//  TemplateItem+CoreDataProperties.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//
//

import Foundation
import CoreData


extension TemplateItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TemplateItem> {
        return NSFetchRequest<TemplateItem>(entityName: "TemplateItem")
    }

    @NSManaged public var templateID: Int64
    @NSManaged public var scheduleItem: NSSet?

}

// MARK: Generated accessors for scheduleItem
extension TemplateItem {

    @objc(addScheduleItemObject:)
    @NSManaged public func addToScheduleItem(_ value: ScheduleItem)

    @objc(removeScheduleItemObject:)
    @NSManaged public func removeFromScheduleItem(_ value: ScheduleItem)

    @objc(addScheduleItem:)
    @NSManaged public func addToScheduleItem(_ values: NSSet)

    @objc(removeScheduleItem:)
    @NSManaged public func removeFromScheduleItem(_ values: NSSet)

}

extension TemplateItem : Identifiable {

}

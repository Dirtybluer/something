//
//  PrivateLesson+CoreDataProperties.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//
//

import Foundation
import CoreData


extension PrivateLesson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PrivateLesson> {
        return NSFetchRequest<PrivateLesson>(entityName: "PrivateLesson")
    }

    @NSManaged public var describe: String?
    @NSManaged public var discipline: String?
    @NSManaged public var endTime: String?
    @NSManaged public var guestInfo: String?
    @NSManaged public var level: String?
    @NSManaged public var locker: String?
    @NSManaged public var name: String?
    @NSManaged public var roomNumber: String?
    @NSManaged public var shortName: String?
    @NSManaged public var startTime: String?

}

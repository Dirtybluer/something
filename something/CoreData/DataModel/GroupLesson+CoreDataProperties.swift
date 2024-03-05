//
//  GroupLesson+CoreDataProperties.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//
//

import Foundation
import CoreData


extension GroupLesson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupLesson> {
        return NSFetchRequest<GroupLesson>(entityName: "GroupLesson")
    }

    @NSManaged public var describe: String?
    @NSManaged public var discipline: String?
    @NSManaged public var endTime: String?
    @NSManaged public var guestType: String?
    @NSManaged public var meetingPoint: String?
    @NSManaged public var name: String?
    @NSManaged public var requiredCertificate: String?
    @NSManaged public var shortName: String?
    @NSManaged public var startTime: String?

}

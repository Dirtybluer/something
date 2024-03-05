//
//  Service+CoreDataProperties.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//
//

import Foundation
import CoreData


extension Service {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Service> {
        return NSFetchRequest<Service>(entityName: "Service")
    }

    @NSManaged public var department: String?
    @NSManaged public var describe: String?
    @NSManaged public var endTime: String?
    @NSManaged public var meetingPoint: String?
    @NSManaged public var name: String?
    @NSManaged public var shortName: String?
    @NSManaged public var startTime: String?

}

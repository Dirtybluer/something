//
//  Other+CoreDataProperties.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//
//

import Foundation
import CoreData


extension Other {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Other> {
        return NSFetchRequest<Other>(entityName: "Other")
    }

    @NSManaged public var describe: String?
    @NSManaged public var endTime: String?
    @NSManaged public var name: String?
    @NSManaged public var shortName: String?
    @NSManaged public var startTime: String?

}

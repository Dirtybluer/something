//
//  TemplateItem+CoreDataClass.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//
//

import Foundation
import CoreData


public class TemplateItem: NSManagedObject {
    static func withID(_ id: Int64, context: NSManagedObjectContext) -> TemplateItem? {
        // look up template id in core data
        let request = NSFetchRequest<TemplateItem>(entityName: "TemplateItem")
        request.predicate = NSPredicate(format: "templateID = %@", NSNumber(value: Int(id)))
        request.sortDescriptors = [NSSortDescriptor(key: "templateID", ascending: true)]
        
        let templateItems = (try? context.fetch(request)) ?? []
        
        if let templateItem = templateItems.first {
            print("found templateItem with id \(id)")
            return templateItem
        } else {
            return nil
        }
    }
}

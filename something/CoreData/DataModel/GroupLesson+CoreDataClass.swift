//
//  GroupLesson+CoreDataClass.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//
//

import Foundation
import CoreData


public class GroupLesson: TemplateItem {
    
    static func addNewGroupLesson(context: NSManagedObjectContext, name: String?, templateID: Int64?, shortName: String?, describe: String?, discipline: String?, guestType: String?, requiredCertificate: String?, startTime: String?, endTime: String?, meetingPoint: String?) {
        
        let newGroupLesson = NSEntityDescription.insertNewObject(forEntityName: "GroupLesson", into: context) as! GroupLesson
        
        newGroupLesson.name = name
        if let templateID = templateID {
            newGroupLesson.templateID = templateID
        }
        newGroupLesson.shortName = shortName
        newGroupLesson.describe = describe
        newGroupLesson.discipline = discipline
        newGroupLesson.guestType = guestType
        newGroupLesson.requiredCertificate = requiredCertificate
        newGroupLesson.startTime = startTime
        newGroupLesson.endTime = endTime
        newGroupLesson.meetingPoint = meetingPoint
    }
    
    static func createDummyData(context: NSManagedObjectContext) {
        let resourceName = "GroupLesson"
        
        if let resourceCSVData = CSVData(resourceNames: [resourceName]).getData()[resourceName] {
            
            let numOfRows = resourceCSVData.count
            
            for rowNumber in 1..<numOfRows {
                let resourceRow = resourceCSVData[rowNumber]
                
                GroupLesson.addNewGroupLesson(context: context, name: resourceRow[0], templateID: Int64(resourceRow[1]), shortName: resourceRow[2], describe: resourceRow[3], discipline: resourceRow[4], guestType: resourceRow[5], requiredCertificate: resourceRow[6], startTime: resourceRow[7], endTime: resourceRow[8], meetingPoint: resourceRow[9])
            }
        } else {
            print("Failed to read dummy data for GroupLesson")
        }
    }
}

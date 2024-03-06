//
//  ScheduleItem+CoreDataClass.swift
//  something
//
//  Created by 张萌琦 on 2024/3/5.
//
//

import Foundation
import CoreData


public class ScheduleItem: NSManagedObject {
    static func addNewScheduleItem(context: NSManagedObjectContext, scheduleName: String?, scheduleDescribe: String?, meetingPoint: String?, date: Date?, startTime: String?, endTime: String?, scheduleType: String?, scheduleItemTemplate: TemplateItem?, signUpNumber: Int64?, instructors: NSSet?, gmtCreate: Date?, gmtModify: Date?, instructorNum: Int64?) {
        
        let newScheduleItem = NSEntityDescription.insertNewObject(forEntityName: "ScheduleItem", into: context) as! ScheduleItem
        
        newScheduleItem.scheduleName = scheduleName
        newScheduleItem.scheduleDescribe = scheduleDescribe
        newScheduleItem.meetingPoint = meetingPoint
        newScheduleItem.date = date
        newScheduleItem.startTime = startTime
        newScheduleItem.endTime = endTime
        newScheduleItem.scheduleType = scheduleType
        newScheduleItem.scheduleItemTemplate = scheduleItemTemplate
        if let signUpNumber = signUpNumber {
            // because Int64? has to be unwrapped to be able to assgined here, for some unknown reason
            // instead of fill in -1 in case of nil, we dont execute the following command to leave it at nil in database
            newScheduleItem.signUpNumber = signUpNumber
        }
        newScheduleItem.instructors = instructors
        newScheduleItem.gmtCreate = gmtCreate
        newScheduleItem.gmtModify = gmtModify
        if let instructorNum = instructorNum {
            // the same logic as signUpNumber
            newScheduleItem.instructorNum = instructorNum
        }
    }
    
    static func createDummyData(context: NSManagedObjectContext) {
        let resourceName = "ScheduleItem"

        if let resourceCSVData = CSVData(resourceNames: [resourceName]).getData()[resourceName] {
            for rowNumber in 1..<resourceCSVData.count {
                let resourceRow = resourceCSVData[rowNumber]
                var instructors: NSSet? = nil
                var scheduleItemTemplate: TemplateItem? = nil
                
                if let instructor = Instructor.withSkiName(resourceRow[9].uppercased(), context: context) {
                    instructors = NSSet(array: [instructor])
                }
                
                if let templateID = Int64(resourceRow[7]) {
                    if let templateItemWithID = TemplateItem.withID(id: templateID, context: context) {
                        scheduleItemTemplate = templateItemWithID
                    }
                }
                
                ScheduleItem.addNewScheduleItem(context: context, scheduleName: resourceRow[0], scheduleDescribe: resourceRow[1], meetingPoint: resourceRow[2], date: generateDateFromString(dateString: resourceRow[3]), startTime: resourceRow[4], endTime: resourceRow[5], scheduleType: resourceRow[6], scheduleItemTemplate: scheduleItemTemplate, signUpNumber: Int64(resourceRow[8]), instructors: instructors, gmtCreate: Date(), gmtModify: nil, instructorNum: Int64(resourceRow[12]))
            }
        }
        
        
    }
}

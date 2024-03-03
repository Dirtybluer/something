//
//  DataStructures.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI

struct ScheduleItem: Identifiable {
    let id = UUID()
    let timeRange: String
    let name: String
    let numberOfParticipants: Int
    let numberOfInstructors: Int
    let location: String
    let imageName: String
}

struct LessonItem: Identifiable {
    let id = UUID()
    let name: String
    let lessonStartTime: Date
    let lessonEndTime: Date
    let timeRange: String // to be deleted
    let numberOfParticipants: Int
    let listOfInstructors: [InstructorItem]
    let meetingPoint: String?
    let roomNumber: String?
    let skiLocker: String?
    let skiOrSb: Bool? // true means ski, false means sb
    let level: String?
    let imageName: String
    let color: Color
    let emoji: String
    
    init(name: String,
         lessonStartTime: Date,
         lessonEndTime: Date,
         timeRange: String,
         numberOfParticipants: Int = 0,
         listOfInstructors: [InstructorItem] = [],
         meetingPoint: String?,
         roomNumber: String? = nil,
         skiLocker: String? = nil,
         skiOrSb: Bool? = nil,
         level: String? = nil,
         imageName: String,
         color: Color = Color.yellow,
         emoji: String = "🏂") {
        self.name = name
        self.lessonStartTime = lessonStartTime
        self.lessonEndTime = lessonEndTime
        self.timeRange = timeRange
        self.numberOfParticipants = numberOfParticipants
        self.listOfInstructors = listOfInstructors
        self.meetingPoint = meetingPoint
        self.roomNumber = roomNumber
        self.skiLocker = skiLocker
        self.skiOrSb = skiOrSb
        self.level = level
        self.imageName = imageName
        self.color = color
        self.emoji = emoji
    }
}

struct InstructorItem: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

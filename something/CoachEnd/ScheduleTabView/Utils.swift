//
//  Utils.swift
//  something
//
//  Created by 张萌琦 on 2024/2/23.
//

import Foundation
import SwiftUI

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, yyyy"
    return formatter
}

var backgroundGeryColor: Color { Color(red: 243/255, green: 242/255, blue: 248/255) }

var exampleInstructures: [InstructorItem] = [
    InstructorItem(name: "Sammy", color: Color(red: 157/255, green: 11/255, blue: 82/255)),
    InstructorItem(name: "Ben", color: Color(red: 251/255, green: 113/255, blue: 37/255)),
    InstructorItem(name: "Lena", color: Color(red: 0/255, green: 108/255, blue: 101/255))
]

var exampleLessons: [LessonItem] = [
    LessonItem(name: "Rider - AM", lessonStartTime: Date(), lessonEndTime: Date(), timeRange: "9:00 - 11:00", numberOfParticipants: 15, listOfInstructors: exampleInstructures, meetingPoint: "Small Kids Room", imageName: "sun.min.fill"),
    LessonItem(name: "Private Lesson", lessonStartTime: Date(), lessonEndTime: Date(), timeRange: "13:00 - 15:00", numberOfParticipants: 3, meetingPoint: "Locker", roomNumber: "1234", skiLocker: "H - 234", skiOrSb: true, level: "Trident 2", imageName: "snow"),
    LessonItem(name: "Tea Time", lessonStartTime: Date(), lessonEndTime: Date(), timeRange: "16:00 - 17:00", meetingPoint: "Theatre", imageName: "cup.and.saucer.fill"),
    LessonItem(name: "Night Shift", lessonStartTime: Date(), lessonEndTime: Date(), timeRange: "20:15 - 22:30", meetingPoint: "Theatre", imageName: "moon.fill")
]

